#!/usr/bin/env ruby

source_code = <<~RUBY
10.times do |n|
  puts n
end
RUBY

puts RubyVM::InstructionSequence.compile(source_code).disasm

