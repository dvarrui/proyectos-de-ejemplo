#!/usr/bin/env ruby

require_relative 'lib/func/monomio'
require_relative 'lib/func/polinomio'


puts "[info] Monomios"
mon1 = [ 4, 3 ]
puts mon1.to_s
puts Monomio.array_to_s(mon1)
puts Monomio.to_s(5, 7)

puts "[info] Polinomios"
pol1 = [ [3,2], [-5,0]]
puts pol1.to_s
puts Polinomio.array_to_s(pol1)
#puts p
#puts p.to_h
