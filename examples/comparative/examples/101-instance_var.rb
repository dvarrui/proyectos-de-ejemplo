#!/usr/bin/env ruby

class Person
  @rol = "jedi"

  def initialize(name)
    @name = name
  end

  def rol=(rol)
    @rol = rol 
  end

  def to_s
    "name=#{@name}, rol=#{@rol}"
  end
end

yoda = Person.new("yoda")
puts "yoda  => #{yoda}" 
vader = Person.new("vader")
puts "vader => #{vader}"

vader.rol="sith"
puts "vader => #{vader}"
puts "yoda  => #{yoda}" 
