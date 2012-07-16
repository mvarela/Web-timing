#!/usr/bin/env ruby

# Martin Varela, VTT, 2012-07
# This script parses HAR archives containing information about the timing of
# web page loading, and stores the information in  an SQL backend (sqlite
# in the simplest case)


require 'json'
require 'Time'
require 'sqlite3'
require 'getoptlong'

# reads a HAR file
def read_har(fname)
  begin
    JSON.parse File.read(fname)
  rescue Exception => e
    p e.message
    p e.backtrace
    exit
  end
end



# creates the DB
def create_db(dbname)
  begin
    db = SQLite3::Database.new dbname
    db.execute "CREATE TABLE measurements (archivename TEXT PRIMARY KEY,
                                        url TEXT, starttime TEXT,
                                        numreqs INTEGER,
                                        oncontentload INTEGER,
                                        onload INTEGER);"
    
    db.execute "CREATE TABLE requests (mid TEXT, url TEXT,
                                      starttimeoffset INTEGER, duration INTEGER,
                                      size INTEGER, mimetype TEXT, status TEXT,
                                      FOREIGN KEY (mid)
                                      REFERENCES measurements(archivename));"
  rescue Exception => e
    p e.message
    p e.backtrace
    exit
  end
  return db
end



# Processes a HAR archive
# This creates a measurement in the DB, along with several
# requests and their associated data

def process_har(db, fname)

  mdata = (read_har fname)["log"]
  aname = File.basename fname

  # stuff that goes into the measurements table
  mid           = aname

  page          = mdata["pages"][0]
  url           = page["id"]
  start_time    = page["startedDateTime"]
  basetime      = Time.parse start_time
  numreqs       = mdata["entries"].size
  oncontentload = page["pageTimings"]["onContentLoad"]
  onload        = page["pageTimings"]["onLoad"]

  # Create measurement entry
  db.execute "INSERT INTO measurements VALUES ('#{aname}', '#{url}',
                                               '#{start_time}', #{numreqs},
                                                #{oncontentload},
                                                #{onload})"
  
  # Process the requests
  mdata["entries"].each do |e|

    url = e["request"]["url"]
    stime = Time.parse e["startedDateTime"]
    starttimeoffset = stime - basetime
    duration = e["time"]
    size = e["response"]["content"]["size"]
    mimetype = e["response"]["content"]["mimeType"]
    status = e["response"]["status"]

    db.execute "INSERT INTO requests VALUES ('#{mid}', '#{url}',
                                             #{starttimeoffset}, #{duration},
                                             #{size}, '#{mimetype}',
                                             '#{status}');" 
  end
  
end

# Main

options = {:db => "timings.db", :dir => "out"}

opts = GetoptLong.new(
  ['--database','-d', GetoptLong::REQUIRED_ARGUMENT],
  ['--har-dir','-h', GetoptLong::REQUIRED_ARGUMENT])


opts.each do |opt, arg|
  case opt
  when '--database' then
    options[:db] = arg
  when '--har-dir' then
    options[:dir] = arg
  else
    puts "Unknown argument"
    exit 1
  end
end

db = create_db options[:db]
dir = options[:dir]
files = Dir.glob "#{dir}/*har"
files.each do |f|

  p "processing #{f}"
  process_har(db, f)
  
end

  

