#!/usr/bin/env ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def greet
    puts("Hello! I'm #{@name}.")
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end
end

p = Person.new('Yoda', 900)
p.greet
puts p                      # Call method to_s to convert object to String

Person.new('Obiwan', 53).greet
