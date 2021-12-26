#!/usr/bin/ruby
# Calcular factoriales
num = ARGV[0].to_i

if num <= 0
  puts('¡ERROR! Debes introducir un número entero positivo')
else
  (1..num).each do |i|
    factor = 1
    (1..i).each { |j| factor = factor * j }
    puts "#{i}! = #{factor}"
  end
end
