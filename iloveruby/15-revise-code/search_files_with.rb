#!/usr/bin/env ruby

require_relative 'lib/revise_input'

# revise_input ARGV
# rootbase = File.basename(ARGV[0])
# rootdir = File.dirname(ARGV[0])

rootbase = ARGV[0]
words = ARGV[1].split(",")
filter = ""
words.each { |w| filter+=" |grep #{w} " }

rbfiles = File.join(rootbase, "**", "*.rb")
files = Dir.glob(rbfiles)
files.sort.each do |f|
  t = "cat #{f} #{filter} |wc -l"
  r = `#{t}`
  if r.to_i>0 
    puts "* <#{f}> (#{r.to_i},#{words.size})"  
  end
end
