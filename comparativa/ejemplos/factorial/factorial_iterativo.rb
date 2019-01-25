#!/usr/bin/env ruby

def factorial(n)
  f=1
  (2..n).each { |i| f*=i }
  return f
end

puts "    3! = #{factorial(3)}"
puts "   30! = #{factorial(30)}"
puts " 3000! = #{factorial(3000)}"
