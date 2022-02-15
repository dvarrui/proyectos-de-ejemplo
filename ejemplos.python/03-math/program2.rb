#!/usr/bin/ruby

num = ARGV[0].to_i
sum = 0

if num <= 0
  puts('¡ERROR! Debes introducir un número entero positivo')
  exit
else
  (1..num).each { |i| sum = sum + i**2 }
end
puts "La suma de los cuadrados de los #{num} primeros números naturales es #{sum}"
