#!/usr/bin/env ruby

print "Write a number: "
number = gets.to_i

def multiplication_table(number)
  1.upto(10) do |i|
    puts " %2d * %2d = %3d" % [ i, number, i*number ]
  end
end

multiplication_table number
