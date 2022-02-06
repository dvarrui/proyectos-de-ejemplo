#!/usr/bin/env ruby

# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. 
# The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

# Help: https://ruby-doc.com/docs/ProgrammingRuby/html/classes.html

module Multiplo
  def is_multiple_of?(number)
    return true if (self%number).zero?
    false
  end
end

class Integer
  include Multiplo
end

below = 999
interval = 1..below

sum = 0
multiples = []
interval.each do |number|
  flag = number.is_multiple_of?(3) || number.is_multiple_of?(5)
  if flag
    sum += number 
    multiples << number
  end
end

puts "Multiples of 3 or 5"
puts "* Interval  : #{interval}"
if multiples.size < 20 
  puts "* Multiples : #{multiples}" 
else
  puts "* Nº multi. : #{multiples.size}" 
end
puts "* Sum       : #{sum}" 

