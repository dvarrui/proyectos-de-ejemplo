#!/usr/bin/env ruby

def sumar(*args)
  s = 0
  args.each { |i| s+= i }
  s
end

c = sumar 3, 2, 1, 1

puts "Ejemplo   : #{$0}"
puts "Resultado : #{c}"
