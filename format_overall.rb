#!/usr/bin/env ruby

file_names = Dir.glob("stats/overall*")

file_names.each do |name|
  next if name =~ /tex$/
  lines = File.readlines name
  f_out = File.open "stats/" + (File.basename name, ".tex") + ".tex", 'w'
  f_out.printf "\\begin{table}[h]\n\\caption{Overall Statistics}\\centering\n"
  f_out.printf "\\begin{tabular}{rl}\n"
  lines.each_slice(2) do |a,b|
    f_out.printf("%s", a.gsub(/_/," ").chomp + " & " + b.chomp + "\\\\\n")
  end
  f_out.printf("\\end{tabular}\n\\end{table}\n")
  f_out.close
end


  
