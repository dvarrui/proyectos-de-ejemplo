#!/usr/bin/env ruby

class Employee
  def self.sample(x)
    puts "Inside static method #{x}"
  end
end

# call static method
Employee.sample 10

# can't  be called using object
emp = Employee.new
begin
  emp.sample 10
rescue NoMethodError
  puts "NoMethodError: static methods belongs to Class not to instances"
end

