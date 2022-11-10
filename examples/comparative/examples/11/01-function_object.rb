#!/usr/bin/env ruby

sum = ->(a, b) { a + b }

puts sum.class
puts sum.call(3,4)

sum = lambda{ |a, b| a + b }

puts sum.class
puts sum.call(3,4)
