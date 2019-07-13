#!/usr/bin/env ruby

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
c = acc

puts "Ejemplo   : #{$0}"
puts "Resultado : #{c}"
