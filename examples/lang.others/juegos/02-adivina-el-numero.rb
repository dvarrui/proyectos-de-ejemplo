#!/usr/bin/env ruby
# Este es el juego de adivinar el número.


print('¡Hola! ¿Cómo te llamas? ')
nombre = gets().chomp

numero = rand(20) + 1
puts("Bueno #{nombre.capitalize}, estoy pensando en un número entre 1 y 20.")

intentos = 0
while intentos < 6 do
  print('Intenta adivinar: ')
  estimacion = gets.to_i
  intentos = intentos + 1
  if estimacion < numero then
    puts('Tu estimación es muy baja.')
  elsif estimacion > numero then
    puts('Tu estimación es muy alta.')
  elsif estimacion == numero then
    break
  end
end

puts ""
if estimacion == numero then
  puts("¡Buen trabajo, #{nombre}! ¡Has adivinado mi número en #{intentos} intentos!")
else
  puts("Pues no. El número que estaba pensando era #{numero}")
end
