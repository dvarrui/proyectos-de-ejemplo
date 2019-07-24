#!/usr/bin/env ruby
# Se añade un acumuador por defecto
puts "Ejemplo   : #{$0}"

$acc = 0

def sumar(*args)
  s = 0
  args.each { |i| s+= i }
  $acc += s
  s
end

def acc
  $acc
end

sumar 3, 2
sumar 1
sumar 1

puts "Resultado : #{acc}"
