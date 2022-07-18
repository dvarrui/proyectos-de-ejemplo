#!/usr/bin/env ruby

class Writer
  def initialize(value, log = "New")
    @value = value
    @log = log
    puts self.to_s
  end

  def self.unit(value, log)
    Writer.new(value, log)
  end

  def bind(proc, log)
    new_value = proc.call(@value)
    self.class.new(new_value, log)
  end

  def to_s
    "#{@log.ljust(17)}: #{@value}"
  end
end

sqrt = ->(number) { Math.sqrt(number) }
add_one = ->(number) { number + 1 }
half = ->(number) { number / 2.0 }

m = Writer.unit(5, "Initial value")
m.bind(sqrt, "Took square root").bind(add_one, "Added one").bind(half, "Divided by 2")

