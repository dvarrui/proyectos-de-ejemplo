#!/usr/bin/env ruby

number = ARGV.first.to_i || 10

def multiplication_table(number)
  1.upto(10) do |i|
    puts " %2d * %2d = %3d" % [ i, number, i*number ]
  end
end

multiplication_table number
