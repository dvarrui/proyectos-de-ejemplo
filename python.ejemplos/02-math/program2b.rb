#!/usr/bin/ruby

p0 = Complex( ARGV[0].to_f, ARGV[1].to_f )
p1 = Complex( ARGV[2].to_f, ARGV[3].to_f )
p2 = Complex( ARGV[4].to_f, ARGV[5].to_f )

dist1 = (p1-p0).abs
dist2 = (p2-p0).abs

puts "="*40
puts "p0(#{p0})"
puts "p1(#{p1}) dist=#{dist1}"
puts "p2(#{p2}) dist=#{dist2}"
puts "="*40
print "El punto más cercano a p0 es "


if dist1 < dist2
  puts "p1"
else
  puts "p2"
end
