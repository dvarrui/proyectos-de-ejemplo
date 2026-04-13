#!/usr/bin/env ruby
require_relative "lib/basic"

if ARGV[0]
  source = File.read(ARGV[0])
  transpiler = Ruby2Basic.new(source)
  puts transpiler.transpile
else
  puts "Uso: ruby #{$0} FILENAME.rb"
end

