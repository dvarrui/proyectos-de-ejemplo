#!/usr/bin/env ruby

require_relative '02-nubex-lib'

a = Nubex.new(1,1)

puts "Factorizar #{90} => #{a.factorize(90)}"
puts "Factorizar #{244} => #{a.factorize(244)}"
puts "Factorizar #{165} => #{a.factorize(165)}"
