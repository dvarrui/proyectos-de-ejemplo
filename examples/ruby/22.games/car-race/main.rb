#!/usr/bin/env ruby

require "colorize"
require_relative "screen"
require_relative "world"

trap('SIGINT') { puts "Bye!"; exit! }

screen = Screen.new
world = World.new(screen)

screen.clear
loop do
  world.update
  world.render
  screen.move_top_left
  sleep 0.1
end
