#!/usr/bin/env ruby

require 'test/unit' 

extend Test::Unit::Assertions

a = 2
b = 3
c = a * b

assert a == 2
assert b == 3

begin
  assert c == 5 
rescue 
  puts("[ ERROR ] Controlado!")
end
