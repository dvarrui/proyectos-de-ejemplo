#!/usr/bin/env ruby

require "colorize"
require_relative "screen"

trap('SIGINT') { puts "Bye!"; exit! }

screen = Screen.new
road_positions = Array.new(screen.height, screen.width/2 - 5)
colors = %I(red green blue magenta cyan)

screen.clear
loop do
  new_road_position = road_positions.last + 1 - rand(3)
  if new_road_position < 10 || new_road_position > screen.width - 10
    new_road_position = road_positions.last
  end
  road_positions.push(new_road_position)
  road_positions.shift

  road_positions.reverse.each_with_index do |x, y|
    screen.show x, y, "#          #".cyan
  end
  screen.move_top_left
  sleep 0.1
end
