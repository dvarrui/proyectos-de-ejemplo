#!/usr/bin/env ruby

def m1(*)
  puts "m1(*) => "
end

def m2(value)
  puts "m2(value) => value = #{value}"
end

def m3(*args)
  puts "m3(*args) => args = #{args}"
end

puts "\n"
puts "=> def m1(*) ..."
print "   m1 'a' 'b' 'c' => "
m1 'a' 'b' 'c'
print "   m1 'a','b','c' => "
m1 'a', 'b', 'c'

puts "\n"
puts "=> def m2(value) ..."
print "   m2 'a' 'b' 'c' => "
m2 'a' 'b' 'c'
print "   m2 'a','b','c'"
puts "   Argument error"

# m2 'a', 'b', 'c' # => Argument error

puts "\n"
puts "=> def m3(*args)"
print "   m3 'a' 'b' 'c' =>" 
m3 'a' 'b' 'c' 
print "   m3 'a', 'b', 'c' => "
m3 'a', 'b', 'c'


