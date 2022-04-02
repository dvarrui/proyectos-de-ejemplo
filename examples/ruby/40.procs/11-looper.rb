#!/usr/bin/env ruby
#

class Looper

  def initialize(&block)
    @block = block
    @counter = 0
  end

  def run
    @block.call(@count)
    @counter += 1
  end

  def repeat(number)
    number.times { self.run }
  end

end

bucle = Looper.new { puts "I Love Ruby!" }
bucle.repeat 3
