#!/usr/bin/env ruby

class Person
end

class Jedi < Person
end

puts "==> Jedi class:"
puts Jedi
puts Jedi.class
puts Jedi.superclass

puts "==> Person class:"
puts Person
puts Person.class
puts Person.superclass
