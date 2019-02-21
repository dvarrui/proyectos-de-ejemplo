#!/usr/bin/ruby

nota = ARGV[0].to_f

if nota < 0 or nota > 10
  puts '¡ERROR! Sólo puedes introducir calificaciones de 0 a 10 puntos'
elsif nota >= 0 and nota < 5
  puts "Tu calificación es de #{nota} puntos. Estas suspendido."
elsif nota >= 5 and nota < 7
  puts "Tu calificación es de #{nota} puntos. Tienes un aprobado."
elsif nota >= 7 and nota < 9
  puts "Tu calificación es de #{nota} puntos. Tienes un notable."
elsif nota >= 9 and nota < 10
  puts "Tu calificación es de #{nota} puntos. Tienes un sobresaliente."
else
  puts "Tu calificación es de #{nota} puntos. Tienes matrícula de honor."
end
