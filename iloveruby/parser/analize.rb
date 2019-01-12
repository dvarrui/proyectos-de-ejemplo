#!/usr/bin/env ruby

require_relative 'lib/parser'

mp = Parser.new
mp.parse(ARGV[0])
