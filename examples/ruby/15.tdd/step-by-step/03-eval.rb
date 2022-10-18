#!/usr/bin/env ruby

source = <<~RUBY
  a = 3
  b = 4
  c = a + b
  puts c
RUBY

source.split("\n").each_with_index do |line, index|
  puts "#{index}: #{line}"
  eval(line, binding)
end
