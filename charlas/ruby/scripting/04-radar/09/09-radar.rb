#!/usr/bin/env ruby

require_relative '09-radar-lib'

content = `cat 09-hosts.txt`
ips = content.split("\n")

max = 1
max = ARGV[0].to_i if not ARGV.nil?

(1..max).each do |i|
  data = scan ips
  show_results data
  puts "Iteración [#{i}/#{max}]"
end
