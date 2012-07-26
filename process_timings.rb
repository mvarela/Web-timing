#!/usr/bin/env ruby

# Martin Varela, VTT, 2012-07
# This script processes the data collected in the timings database
# and generates the relevant statistics and associated scripts (R and shell)

require 'sqlite3'


def read_urls(db)
  db.execute "select distinct(url) from measurements;"
end

db = SQLite3::Database.open "timings.db"
urls = read_urls db
db.close

sql_out = File.open 'run_process_script.sql', 'w'

sql_out.printf ".mode csv\n.header on\n"

mimetypes = ["image", "html", "javascript", "css"]

urls.each do |u|
  url = u[0]
  suffix = url.gsub(/^htt.*\:\/\//, "").gsub(/[^A-z]/, "_")

  # Overall stats for each site
  sql_out.printf ".output 'stats/overall_stats-#{suffix}'\n"
  sql_out.printf "select count(*) as total_measurements from measurements where url like '#{url}';\n"
  sql_out.printf "select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like '#{url}';\n"
  mimetypes.each do |m|
    sql_out.printf "select count(*) as total_#{m}_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like '#{url}' and r.mimetype like '%%#{m}%%';\n"
  end

  mimetypes.each do |m|
    sql_out.printf ".output 'stats/#{m}_stats-#{suffix}'\n"
    sql_out.printf "select (r.starttimeoffset*1000) as starttime, r.duration, r.size from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%%#{url}%%' and mimetype like '%%#{m}%%';\n"
  end
  
  # Data from the different request types
#  sql_out.printf "select r.starttime"

  
  # img_requests = db.execute "select * from measurements as M inner join requests as R where M.url like '%blog%' and R.mimetype like '%image%' and R.starttimeoffset >= 0 and R.duration >=0 and R.size >= 500;"
  # print "#{url}: #{measurements.size} measurments and  #{img_requests.size} image requests\n"
end

sql_out.close
