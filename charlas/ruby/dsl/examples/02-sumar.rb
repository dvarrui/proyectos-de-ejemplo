#!/usr/bin/env ruby
puts "Ejemplo   : #{$0}"


def sumar(a,b)
  a+b
end

c = sumar 3, (sumar 2,2)

puts "Resultado : #{c}"
