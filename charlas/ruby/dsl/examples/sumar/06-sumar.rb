#!/usr/bin/env ruby
# Se convierte a POO
require_relative '06-sumar-lib'
puts "Ejemplo   : #{$0}"

c = Calculadora.new
c.sumar 3, 2
c.sumar 1
c.sumar 1

puts "Resultado : #{c.acc}"
