#!/usr/bin/env ruby

require "colorize"
require "debug"

module StepByStep
  def self.call(source)
    scope = binding
    source.split("\n").each_with_index do |line, index|
      system("clear")
      show_code(source, index)
      begin
        scope = eval("#{line}; binding", scope)
      rescue NameError => e
        puts "[NameError] #{e}"
      end
      print "(enter)"
      gets
    end
  end

  def self.show_code(source, current)
    lines = source.split("\n")
    lines.each_with_index do |line, index|
      str = "#{index}: #{line}"
      str = str.colorize(:white) unless index == current
      puts str
    end
  end
end

source = <<~RUBY
  a = 3
  b = 4
  c = a + b
  puts c
RUBY

StepByStep.call(source)
