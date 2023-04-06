#!/usr/bin/env ruby

cmds = ["ls" , "sl"]

cmds.each do |cmd|
  puts "==> Executing: #{cmd}"
  system(cmd)
  puts "==> Exit code: #{$?.exitstatus}\n\n"
end
