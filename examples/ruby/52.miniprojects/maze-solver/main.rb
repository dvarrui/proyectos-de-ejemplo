#!/usr/bin/env ruby

require_relative "loader"
require_relative "maze"

maze = Maze.new
maze.map = Loader.call("maze.txt")
puts maze.to_s