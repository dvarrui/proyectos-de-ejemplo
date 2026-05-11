#!/usr/bin/env ruby

require_relative "lib/loader"
require_relative "lib/maze"
# require "debug"

filepath = ARGV.first
maze = Maze.new(Loader.call(filepath))
maze.show
maze.solve!
maze.show
