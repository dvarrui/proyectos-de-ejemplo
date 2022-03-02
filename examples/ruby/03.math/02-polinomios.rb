#!/usr/bin/env ruby

require_relative 'lib/monomio'
require_relative 'lib/polinomio'

m = Monomio.new(4,3)

puts "[info] Monomio 4,3"
p m
puts m
puts m.to_h

puts "[info] Polinomio 3,2 -5,0"
p = Polinomio.new( [Monomio.new(3,2), Monomio.new(-5,0)])
puts p
puts p.to_h
