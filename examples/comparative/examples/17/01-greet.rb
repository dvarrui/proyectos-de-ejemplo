#!/usr/bin/env ruby

def greet
  name = "Obiwan"
  puts "Hello! I'm #{name}"
 end

greet # => Obiwan

# Sin embargo, tratar de usar la variable name fuera de la función es un error.
puts name

# => Hello! I'm Obiwan
# => ./01-greet.rb:11:in `<main>': undefined local variable or method `name' for main:Object (NameError)
#
# => puts name
# =>      ^^^^
