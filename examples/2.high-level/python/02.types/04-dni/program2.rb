#!/usr/bin/ruby

NUCLEOBASES = "ATGC"*100
sequence = NUCLEOBASES.chars[0,100].shuffle.join("")

a = c = g = t = 0

sequence.each_char do |i|
  a = a + 1 if i == 'A'
  g = g + 1 if i == 'G'
  c = c + 1 if i == 'C'
  t = t + 1 if i == 'T'
end

puts("Adenine  : #{a}")
puts("Guanine  : #{g}")
puts("Cytosine : #{c}")
puts("Thymine  : #{t}")
puts sequence
