#!/usr/bin/env ruby

require_relative 'lib/saludar05'

nombre = ARGV[0]

if ARGV.size.zero?
    decir '¡Disculpe! ¿Le conozco?'
elsif ARGV.size == 1
  preguntar_a nombre.capitalize
elsif ARGV.size == 2
  number = ARGV[1].to_i
  number.times { decir hola_a(nombre) }
else
  number = ARGV[1].to_i
  decir 'ESO LOS SERAS TUUUU'
  (1..number).each { |cadavez| decir hola_a(nombre, cadavez) }
end
