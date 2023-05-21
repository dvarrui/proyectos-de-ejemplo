#!/usr/bin/env ruby

require "colorize"

def clear_screen = puts "\033[2J"
def move_cursor(x, y) = print "\033[#{y};#{x}H"
def move_cursor_top_left = move_cursor(0, 0)

trap('SIGINT') { puts "Bye!"; exit! }

screen_size = `stty size`.scan(/\d+/)
total_width = screen_size[1].to_i
total_height = screen_size[0].to_i
road_positions = Array.new(total_height, total_width/2 - 5)
colors = %I(red green blue magenta cyan)

clear_screen
loop do
  new_road_position = road_positions.last + 1 - rand(3)
  new_road_position = road_positions.last if new_road_position < 10 || new_road_position > total_width - 10
  road_positions.push(new_road_position)
  road_positions.shift

  road_positions.reverse.each_with_index do |x, y|
    move_cursor(x, y)
    print "#          #".cyan
  end
  move_cursor_top_left
  sleep 0.1
end
