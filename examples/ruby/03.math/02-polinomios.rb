#!/usr/bin/env ruby

require_relative 'lib/monomio'

m = Monomio.new(4,3)

puts "[info] Monomio 4,3"
p m
puts m
puts m.to_s(:vector)
puts m.to_s(:simple)
