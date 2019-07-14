#!/usr/bin/env ruby
# Se usan los bloques de código dentro del objeto
require_relative '07-sumar-lib'
puts "Ejemplo   : #{$0}"

c = Calculadora.new

c.calcula do
  sumar 3, 2
  suma 1
  add 1
end

puts "Resultado : #{c.acc}"
