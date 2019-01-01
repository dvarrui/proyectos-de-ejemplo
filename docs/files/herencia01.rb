#!/usr/bin/ruby
# En Ruby NO se permite la herencia múltiple
# Para resolver este problema tiene los MIXINS

class PowerDevice
  def start
    puts "PowerDevice: Starting..."
  end
end

class Scanner < PowerDevice
  def start
    puts "Scanner: Starting..."
  end

  def read_input
    puts "Scanning..."
  end
end

class Printer < PowerDevice
  def start
    puts "Printer: Starting..."
  end

  def write_ouput
    puts "Writting..."
  end
end

class MyDevice < Scanner
end

m = MyDevice.new
m.start
m.read_input
