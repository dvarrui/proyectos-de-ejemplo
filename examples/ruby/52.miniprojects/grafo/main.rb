#!/usr/bin/env ruby
require_relative "lib/graph"
require "debug"

g = Graph.new
g.load(ARGV[0])
g.calculate
g.show
