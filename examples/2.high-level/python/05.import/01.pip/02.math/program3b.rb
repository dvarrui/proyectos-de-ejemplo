#!/usr/bin/ruby
require 'pry-byebug'

nota = ARGV[0].to_i

if nota < 0 or nota > 10
  puts '[ERROR] Introducir calificación entre 0 y 10'
  exit 1
end

case nota
when 0..4 then grade = 'suspenso'
when 5..6 then grade = 'aprobado'
when 7..8 then grade = 'notable'
when 9 then grade = 'sobresaliente'
else
  grade = 'matrícula de honor'
end

puts "Tu calificación es #{nota} puntos."
puts "Estas con un/a #{grade}."
