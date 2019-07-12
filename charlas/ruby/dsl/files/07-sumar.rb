#!/usr/bin/env ruby

require_relative '07-sumar-lib'
c = Calculadora.new

c.calcula do
  sumar 3, 2
  suma 1
  add 1
end

puts "Ejemplo   : #{$0}"
puts "Resultado : #{c.acc}"
