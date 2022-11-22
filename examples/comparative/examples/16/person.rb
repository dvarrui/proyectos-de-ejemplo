#!/usr/bin/env ruby

class Person
  @@rol = "jedi"

  def initialize(name)
    @name = name
  end

  def hello1
    puts "Hello1:" + @name
  end

  def hello2
    hello3
  end

  private

  def hello3
    puts "Hello3:" + @name
    puts "Hello3:" + @@rol
  end
end

obiwan = Person.new("Obiwan")
obiwan.hello1
obiwan.hello2

