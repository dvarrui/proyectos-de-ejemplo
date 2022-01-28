#!/usr/bin/ruby

num = ARGV[0].to_i
texto = ARGV[1]

if num <= 0
  puts('¡ERROR! El número introducido no es correcto')
end

palabras = texto.split(" ")
contador = palabras.count { |i| i.size == num }
puts "Hay #{contador} palabras de tamaño #{num}"
