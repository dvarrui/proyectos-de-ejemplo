#!/usr/bin/env ruby

def sum(a, b)
  return a + b
end

m = method :sum

puts m.class
puts m.call(3,4)
