#!/usr/bin/env ruby


puts "[INFO] lambda1"
f1 = lambda { puts "I am function 1" }

f1.call
f1[]
f1.===

puts "\n[INFO] lambda2"
f2 = ->() { puts "I am function 2" }

f2.call
