#!/usr/bin/env ruby

require_relative '06-sumar-lib'

c = Calculadora.new
c.sumar 3, 2
c.sumar 1
c.sumar 1

puts "Ejemplo   : #{$0}"
puts "Resultado : #{c.acc}"
