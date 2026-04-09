#!/usr/bin/env ruby

def create_function(args, &block)
  puts args
  puts block.class
  binding.local_variable_set(args[0].to_sym, 1)
  binding.local_variable_set(args[1].to_sym, 2)
  block.call
end

create_function ['a', 'b'] do
  puts a + b
end