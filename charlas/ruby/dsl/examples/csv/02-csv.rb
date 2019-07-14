#!/usr/bin/env ruby
# Incluir Missing methods
require_relative '02-csv-lib'
puts "Ejemplo   : #{$0}"

#puts csv('datos.csv').select_name.sort

puts "* Head    : #{csv('starwars').head.to_s}"
puts "* Nombre  : #{csv('starwars').nombre.sort}"
puts "* Trabajo : #{csv('starwars').trabajo.uniq.sort}"
