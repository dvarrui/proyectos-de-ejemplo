#!/usr/bin/env ruby

<<<<<<< HEAD:examples/ruby/03.math/polinomios-poo.rb
require_relative 'lib/poo/monomio'
require_relative 'lib/poo/polinomio'
=======
require_relative 'lib/math/monomio'
require_relative 'lib/math/polinomio'
>>>>>>> 88147d97f8f863fb25c7d9199fe8c1053062ea19:examples/ruby/03.math/02-polinomios.rb

m = Monomio.new(4,3)

puts "[info] Monomio 4,3"
p m
puts m
puts m.to_h

puts "[info] Polinomio 3,2 -5,0"
p = Polinomio.new( [Monomio.new(3,2), Monomio.new(-5,0)])
puts p
puts p.to_h
