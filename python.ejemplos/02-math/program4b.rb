#!/usr/bin/ruby

radio = ARGV[0].to_f || 1

puts('Operaciones disponibles')
puts('1 - Calcular el diámetro de la circunferencia')
puts('2 - Calcular el perímetro de la circunferencia')
puts('3 - Calcular el área del círculo')
puts('4 - Salir')

print 'Elige una opción del menú (1-4) '
STDOUT.flush
opcion = STDIN.gets.to_i

case opcion
when 1 then
  diametro = 2 * radio
  puts("El diámetro de la circunferencia es de #{diametro}")
when 2 then
  perimetro = 2 * Math::PI * radio
  puts("El perímetro de la circunferencia es de #{perimetro}")
when 3 then
  area = Math::PI * radio ** 2
  puts("El área del círculo es de #{area}")
when 4 then
  puts('Has elegido salir de la aplicación')
else
  puts('¡ERROR! Sólo puedes elegir una opción entre 1 y 4')
end
