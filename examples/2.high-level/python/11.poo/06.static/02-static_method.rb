#!/usr/bin/env ruby

class Person
  def initialize(name)
    @name = name
  end

  def self.class_method
    puts "Inside class method"
  end

  def instance_method
    puts "Inside instance method " + @name
  end
end

# call static method
Person.class_method

# can't  be called using object
yoda = Person.new("Yoda")
yoda.instance_method
begin
  yoda.class_method
rescue NoMethodError
  puts "NoMethodError: static methods belongs to Class not to instances"
end
