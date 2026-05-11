#!/usr/bin/env ruby

require_relative "loader"
require_relative "maze"
require "debug"

filepath = ARGV.first
maze = Maze.new(Loader.call(filepath))
maze.show
maze.solve!
maze.show
