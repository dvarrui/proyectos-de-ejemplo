#!/usr/bin/ruby
# En Ruby NO se permite la herencia múltiple
# Para resolver este problema tiene los MIXINS

require_relative 'power-device'

module Scanner
  def read_input
    puts "Scanning..."
  end
end

module Printer
  def write_output
    puts "Writting..."
  end
end

class MyDevice < PowerDevice
  include Scanner
  include Printer
end

m = MyDevice.new
m.start
m.read_input
m.write_output
