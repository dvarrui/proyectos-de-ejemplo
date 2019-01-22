#!/usr/bin/env ruby

def factorial(n)
  return 1 if n <= 1
    return n*factorial(n-1)
end

puts "3! = #{factorial(3)}"
puts "30! = #{factorial(30)}"
puts "300! = #{factorial(300)}"
puts "3000! = #{factorial(3000)}"
