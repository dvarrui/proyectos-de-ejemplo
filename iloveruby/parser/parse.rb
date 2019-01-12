#!/usr/bin/env ruby

require_relative 'my-parser'

mp = MyParser.new
mp.parse(ARGV[0])
