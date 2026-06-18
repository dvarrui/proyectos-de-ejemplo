#!/usr/bin/ruby

nota = ARGV[0].to_f

resultado = ''
if nota < 0 or nota > 10
  puts '¡ERROR! Sólo puedes introducir calificaciones de 0 a 10 puntos'
  exit 1
elsif nota >= 0 and nota < 5
  resultado = 'Estas suspendido.'
elsif nota >= 5 and nota < 7
  resultado = 'Tienes un aprobado.'
elsif nota >= 7 and nota < 9
  resultado = 'Tienes un notable.'
elsif nota >= 9 and nota < 10
  resultado = 'Tienes un sobresaliente.'
else
  resultado = 'Tienes matrícula de honor.'
end

puts "Tu calificación es de #{nota} puntos"
puts resultado
