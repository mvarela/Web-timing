#!/usr/bin/env ruby

# Martin Varela, VTT, 2012-07
# This script processes the data collected in the timings database
# and generates the relevant statistics and associated scripts (R and shell)

require 'sqlite3'


def tex_init(tex)

  tex.printf "%s\n", <<-eos
\\documentclass{article}
 \\input{preamble}
  \\begin{document}
  \\maketitle
  \\tableofcontents
eos
end


def tex_overview(suffix)
  "\n\\input{overall_stats-#{suffix}}"
end

def tex_summary(mimetype, suffix)
  "\n\\input{summary-#{mimetype}-#{suffix}}"
end

def tex_histograms(mimetype, suffix)
""
end

def inject_R(file, prefix ,suffix)
  res = <<-eos
  a <- read.csv("#{file}")
  sink("summary-#{prefix}-#{suffix}")
  summary(a)
  sink()
eos

  cols = ["starttime", "duration", "size", "total"]
  cols.each do |c|
   res+= <<-eos2
      s_hist <- hist(a$#{c}, breaks=50)
      data_out <- cbind(s_hist$breaks[-length(s_hist$breaks)],s_hist$counts)
      write.table(data_out, file="#{prefix}-#{c}_hist-#{suffix}", row.names=F, col.names=F, sep='\\t')
eos2
  end
  return res
end


def read_urls(db)
  db.execute "select distinct(url) from measurements;"
end

db      = SQLite3::Database.open "timings.db"
urls    = read_urls db
db.close

sql_out = File.open 'run_process_script.sql', 'w'
r_out   = File.open 'stats/do_stats.R', 'w'
tex_out = File.open 'stats/report.tex', 'w'
tex_init(tex_out)


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

  # LaTeX Code for reporting on the overall stats
  tex_out.printf("\\section{%s}\n",url)
  tex_out.printf("%s\n", tex_overview(suffix))
  

  mimetypes.each do |m|
    filename = "#{m}_stats-#{suffix}" 
    sql_out.printf ".output 'stats/#{filename}'\n"
    sql_out.printf "select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (( r.starttimeoffset*1000 ) +r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%%#{url}%%' and mimetype like '%%#{m}%%' ;\n"

    # Add relevant R commands for processing
    r_out.printf("%s\n", inject_R(filename, m, suffix))

    # Add LaTeX commands for reporting
    tex_out.printf("%s\n", tex_summary(m,suffix))
    tex_out.printf("%s\n", tex_histograms(m,suffix))
  end
  
  # Data from the different request types
#  sql_out.printf "select r.starttime"

  
  # img_requests = db.execute "select * from measurements as M inner join requests as R where M.url like '%blog%' and R.mimetype like '%image%' and R.starttimeoffset >= 0 and R.duration >=0 and R.size >= 500;"
  # print "#{url}: #{measurements.size} measurments and  #{img_requests.size} image requests\n"
end

sql_out.close
r_out.close
tex_out.close


