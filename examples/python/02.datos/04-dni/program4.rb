#!/usr/bin/ruby

numeros = ARGV
contador = 0

numeros.each do |i|
    numero = i.to_f
    contador += numero
end

media = contador / numeros.size.to_f
puts "La media de los #{numeros.size} valores introducidos es #{media}"
