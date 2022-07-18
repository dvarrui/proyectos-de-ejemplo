#!/usr/bin/env ruby

class Writer
  def initialize(value, log = "New")
    @value = value
    @log = log
    puts self.to_s
  end

  def unit
    @value
  end

  def bind(proc, log)
    new_value = proc.call(@value)
    self.class.new(new_value, log)
  end

  def to_s
    "Writer #{@log.rjust(8)}: #{@value}"
  end
end

m = Writer.new(5)

sqrt = ->(number) { Math.sqrt(number) }
add_one = ->(number) { number + 1 }
half = ->(number) { number / 2.0 }

m.bind(sqrt, "Root").bind(add_one, "Add one").bind(half, "Half")

