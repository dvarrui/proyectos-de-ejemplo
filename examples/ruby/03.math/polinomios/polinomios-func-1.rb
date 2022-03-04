#!/usr/bin/env ruby

require_relative 'lib/func.1/monomio'
require_relative 'lib/func.1/polinomio'

puts "[info] Monomios"
mon1a = [ 4, 3 ]
Monomio.puts mon1a
mon1b = Monomio.array_to_s mon1a
Monomio.puts mon1b
puts "-"
mon1c = Monomio.to_s(5, 7)
Monomio.puts mon1c

puts "[info] Polinomios"
pol1a = [ [3,2], [-5,0] ]
pol1b =  Polinomio.array_to_s(pol1a)
Polinomio.puts pol1b
puts "-"
pol2a = { 2 => 3, 1 => -4, 0 => -1 }
pol2b = Polinomio.hash_to_a pol2a
Polinomio.puts pol2b
Polinomio.puts( Polinomio.array_to_s(pol2b))
puts "-"

pol3a = { 2 => -4, 1 => 0, 0 => 3 }
pol3b = Polinomio.hash_to_a pol3a
Polinomio.puts( Polinomio.array_to_s(pol3b))

puts '-'
pol4h = { 2 => 1, 1 => 0, 0 => 2 }
pol5h = { 2 => 1, 1 => 0, 0 => -2 }

Polinomio.puts_h_to_s pol4h
Polinomio.puts_h_to_s pol5h

puts "Suma"
sum = Polinomio.add(pol4h, pol5h)
Polinomio.puts_h_to_s sum

puts "Resta"
del = Polinomio.del(pol4h, pol5h)
Polinomio.puts_h_to_s del

puts "Mul"
pol1h = { 2 => 2, 1 => 0, 0 => 2 }
pol2h = { 2 => 0, 1 => 3, 0 => -1 }
mul = Polinomio.mul(pol1h, pol2h)

Polinomio.puts_h_to_s pol1h
Polinomio.puts_h_to_s pol2h
Polinomio.puts_h_to_s mul
