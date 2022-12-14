#!/usr/bin/env ruby

$name = "Yoda"
puts $name

def greet
  puts "Hello! I'm #{$name}"
  $rol = "Jedi master"
 end

greet
puts "I'm a #{$rol}"
