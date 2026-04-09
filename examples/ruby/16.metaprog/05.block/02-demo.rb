#!/usr/bin/env ruby

def create_function(*args, &block)
  puts args
  puts block
end

create_function('a', 'b') do
  puts "hacer algo"
end