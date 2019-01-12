#!/usr/bin/env ruby

require_relative 'lib/my-parser'

mp = MyParser.new
mp.parse(ARGV[0])
