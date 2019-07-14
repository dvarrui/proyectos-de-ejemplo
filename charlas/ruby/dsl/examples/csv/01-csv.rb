#!/usr/bin/env ruby
# Manipular un CSV
require_relative '01-csv-lib'
puts "Ejemplo   : #{$0}"

#puts csv('datos.csv').select_name.sort

puts "* Head    : #{csv('starwars').head.to_s}"
puts "* Data    : #{csv('starwars').data.to_s}"
puts "* Nombre  : #{csv('starwars').select('nombre').sort}"
