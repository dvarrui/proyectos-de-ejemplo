#!/usr/bin/env ruby
# step 1
print "Write a number: "
number = gets.to_i

1.upto(10) do |i| # step 2
  puts " %2d * %2d = %3d" % [ i, number, i*number ] # step 3
end
