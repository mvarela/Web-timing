#!/bin/bash


# Delete stale stuff
rm stats/*

# Create sql, R and TeX stuff
./process_timings.rb

# Run queries and populate ./stats/
echo "Running queries..."
sqlite3 timings.db < run_process_script.sql

# move into ./stats/ and do the R processing

pushd stats

# remove Google.com css processing in R, since it's empty
gsed -e '/css_stats-www_goog/,+5d' do_stats.R > do_stats2.R
mv do_stats2.R do_stats.R

# run R and tail its log
echo "Doing statistical analysis"
R CMD BATCH do_stats.R
tail do_stats.Rout

# go back up
popd

# generate tables
./format_overall.rb
./format_summaries.rb

# link TeX preamble into ./stats/
ln -s preamble.tex stats/preamble.tex

