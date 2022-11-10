#!/usr/bin/env ruby

class Person
  @rol = "jedi"

  def initialize(name)
    @name = name
  end

  def to_s
    "name=#{@name}, rol=#{@rol}"
  end
end

yoda = Person.new("yoda")
vader = Person.new("vader")

puts "yoda  : #{yoda}"
puts "vader : #{vader}"
