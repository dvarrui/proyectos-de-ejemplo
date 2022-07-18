#!/usr/bin/env ruby

class Writer
  def initialize(value, log = [])
    @value = value
    @log = log
    puts self.to_s
  end

  def unit
    @value
  end

  def bind(proc)
    new_value = proc.call(@value)
    new_log = @log << proc.to_s
    self.class.new(new_value, new_log)
  end

  def to_s
    "Writer monad (value=#{@value}, log=#{@log})"
  end
end

m1 = Writer.new(5)

sqrt = ->(number) { Math.sqrt(number) }
add_one = ->(number) { number + 1 }
half = ->(number) { number / 1 }

m2 = m1.bind(sqrt).bind(add_one).bind(half)

