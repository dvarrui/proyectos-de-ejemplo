#!/usr/bin/env ruby

def sumar(a,b)
  a+b
end

c = sumar 3, (sumar 2,2)

puts "Ejemplo   : #{$0}"
puts "Resultado : #{c}"
