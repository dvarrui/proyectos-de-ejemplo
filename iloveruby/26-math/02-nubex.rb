#!/usr/bin/env ruby

require_relative '02-nubex-lib'

a = Nubex.new(2, 3)
b = Nubex.new(3, 3)

puts "#{a} = #{a.value}"
puts "#{b} = #{b.value}"
