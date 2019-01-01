#!/usr/bin/ruby

require_relative 'my-array-count'

a = MyArrayCount.new
puts "[ DO ] #{a.class.to_s} => add 1, add 2, add 3"
a.add 1
a.add 2
a.add 3
puts "[INFO] #{a.to_s}"

puts "[ DO ] #{a.class.to_s} => add_all [4,5,6]"
a.add_all [4, 5, 6]
puts "[INFO] #{a.to_s}"
