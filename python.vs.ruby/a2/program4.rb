#!/usr/bin/ruby

radio = ARGV[0].to_f

puts('Operaciones disponibles')
puts('(1) - Calcular el diámetro de la circunferencia')
puts('(2) - Calcular el perímetro de la circunferencia')
puts('(3) - Calcular el área del círculo')
puts('(4) - Salir')

puts('Elige una opción del menú (1-4) ')

opcion = gets.to_i

puts opcion

if opcion < 1 or opcion > 4
  puts('¡ERROR! Sólo puedes elegir una opción entre 1 y 4')
elsif opcion == 1
  diametro = 2 * radio
  puts("El diámetro de la circunferencia es de #{diametro}")
elsif opcion == 2
  perimetro = 2 * pi * radio
  puts("El perímetro de la circunferencia es de #{perimetros}")
elsif opcion == 3
  area = pi * radio ** 2
  puts("El área del círculo es de #{area}")
elsif opcion == 4
  puts('Has elegido salir de la aplicación')
end
