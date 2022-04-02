#!/usr/bin/env ruby

numbers = [ 4, -2, 0, 1, -4, -1, 2, 7, -7 ]

def group1(elements)
  puts "[INFO] Using group1"
  zeros = elements.select { _1.zero? }
  positives = elements.select { _1.positive? }
  negatives = elements.select { _1.negative? }
  return negatives, zeros, positives
end

def group2(elements)
  puts "[INFO] Using group2"
  data = { zeros: [], positives: [], negatives: [] }
  elemments.each do |element|
    data[:zeros] << element if element.zero?
    data[:positives] << element if element.positives?
    data[:negatives] << element if element.negatives?
  end

  return data[:negatives], data[:zeros], data[:positives] 
end

n, z, p = group2 numbers

puts " Numbers   : #{numbers}"
puts " Negatives : #{n.sort}"
puts " Zeros     : #{z}"
puts " Positives : #{p.sort}"
