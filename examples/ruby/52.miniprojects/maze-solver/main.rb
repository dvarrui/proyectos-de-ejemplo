#!/usr/bin/env ruby

require_relative "loader"
require_relative "maze"
require "debug"

filepath = "maze.txt"
maze = Maze.new(Loader.call(filepath))
maze.show
maze.solve!
maze.show