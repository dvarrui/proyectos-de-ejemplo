#!/usr/bin/env ruby
# step 1: input number
print "Write a number: "
number = gets.to_i

# step 1: show table
1.upto(10) do |i|
  puts " %2d * %2d = %3d" % [ i, number, i*number ] # step 3
end
