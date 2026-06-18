#!/usr/bin/ruby

num = ARGV[0].to_i
primo = true

if num <= 0
  puts '¡ERROR! Debes introducir un número entero positivo'
else
  (2..(num-1)).each do |i|
    primo = false if ((num % i) == 0)
  end
  if primo
    puts("SI es primo")
  else
    puts("NO es primo")
  end
end
