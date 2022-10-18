#!/usr/bin/env ruby

class Demo
  def self.call
    source = <<~RUBY
      puts d
      a = 3
      b = 4
      c = a + b
      puts c
    RUBY

    d = "hola"

    source.split("\n").each_with_index do |line, index|
      puts "#{index}: #{line}"
      eval(line, binding)
    end
  end
end

Demo.call
