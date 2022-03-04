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
Polinomio.puts pol1a.to_s
pol1b =  Polinomio.array_to_s(pol1a)
Polinomio.puts pol1b
puts "-"
pol2a = { 2 => 3, 1 => -4, 0 => -1 }
Polinomio.puts pol2a
pol2b = Polinomio.hash_to_a pol2a
Polinomio.puts pol2b
Polinomio.puts( Polinomio.array_to_s(pol2b))
puts "-"

pol3a = { 2 => -4, 1 => 0, 0 => 3 }
Polinomio.puts pol3a
pol3b = Polinomio.hash_to_a pol3a
Polinomio.puts pol3b
Polinomio.puts( Polinomio.array_to_s(pol3b))

#puts p
#puts p.to_h
