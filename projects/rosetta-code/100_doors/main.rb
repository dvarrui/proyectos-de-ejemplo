#!/usr/bin/env ruby
# https://rosettacode.org/wiki/100_doors

require_relative 'door'

# Initilize
doors = [nil]
(1..100).each { doors << Door.new(_1) }

# Process
(1..100).each do |s|
  (s..100).step(s) { doors[_1].toggle! }
end

# Show results
doors.delete_at(0)
doors.each { puts _1 }

