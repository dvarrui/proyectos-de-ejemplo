#!/usr/bin/env ruby

class Group
  attr_accessor :members

  def initialize
    @members = []
  end

  def to_s
    "My members are #{@members.to_s}"
  end

  def +(other)
    @members << other.name
  end
end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name}"
  end

  def +(other)
    g = Group.new
    g.members << name
    g.members << other.name
    g
  end
end

obiwan = Person.new("Obiwan")
yoda = Person.new("Yoda")

puts obiwan
puts yoda
puts (obiwan + yoda)
