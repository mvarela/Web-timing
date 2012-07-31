#!/usr/bin/env ruby

file_names = Dir.glob("stats/summary*")

file_names.each do |name|
  next if name =~ /tex$/
  lines = File.readlines name
  f_out = File.open "stats/" + (File.basename name, ".tex") + ".tex", 'w'
  summary_type = name.split("-")[1]
  
#  f_out.printf "\\begin{table}[h]\n"
#  f_out.printf "\\caption{Summary of #{summary_type} requests} \n\\centering\n"
  f_out.printf "\\begin{tabular}{lS[table-format=5.1]S[table-format=5.1]S[table-format=5.1]}\n"

  header = lines.shift.chomp.split
  f_out.printf("& \\mh{%s} & \\mh{%s} & \\mh{%s} \\\\\n", header[0], header[1], header[2])
#  f_out.printf("& %s\n", lines.shift.chomp.split.join(" & ") + "  \\\\")
  lines.each do |l|
    t = l.split(':')[0]
    c = l.chomp.gsub("Qu.","").gsub(':'," ").split
    f_out.printf("%s & %s & %s & %s \\\\\n", t, c[1], c[3], c[5])
  end
  
  f_out.printf "\\end{tabular}\n"
#  f_out.printf "\\end{table}\n"
  
end
