#!/usr/bin/env ruby

## Runs the 'Pagestats' applescript which tells Safari to open a webpage, and save a trace of the timing information it collected.
## This is done for a selection of websites, and periodically every a configurable amount of time, over a longer time period.
## The information is saved in HAR (JSON-based) format in the 'out' directory, under the website's name, and with file names corresponding to timestamps.

# Sites to visit
sites = ["www.google.com", "www.yle.fi", "blog.flickr.net/en", "en.wikipedia.org/wiki/Main_Page", "www.amazon.com", "www.ebay.com", "www.youtube.com", "www.imdb.com", "www.bbc.co.uk/news", "www.npr.org"]

# time between visits (in s)
interval = 600

# overall period (every ten mintes, for 3 days)
timeout = interval * 6 * 24 * 3

# Do our stuff

while timeout > 0

  sites.each do |s|
    out_name = Dir.pwd + "/out/" + s.gsub(/[^A-z]/,'_') + "-" +Time.now.to_s + ".har"
    system "osascript Pagestats.scpt \'http://#{s}\' \'#{out_name}\'"
  end
  
  sleep interval
  
  timeout -= interval
end
