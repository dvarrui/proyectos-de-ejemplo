#!/usr/bin/env ruby
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
interval.each do |number|
  flag = number.is_multiple_of?(3) || number.is_multiple_of?(5)
  sum += number if flag
end

puts "Multiples of 3 or 5"
puts "* Interval  : #{interval}"
puts "* Sum       : #{sum}" 

