#!/usr/bin/env ruby

def factorial(number)
  n = number.to_i
  return 1 if n <= 1

  n * factorial(n-1)
end

numbers = [1.1, 3.2, 0.6, -1.5, 4.8]

numbers.each do |number|
  n = number.to_i
  puts "#{n}! = #{factorial(number)}"
end
