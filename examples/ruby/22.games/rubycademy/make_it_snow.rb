#!/usr/bin/env ruby

def clear_screen = puts "\033[2J"
def move_cursor(x, y) = print "\033[#{y},#{x}H"
def move_cursor_top_left = move_cursor(0, 0)

trap('SIGINT') { puts "Bye!"; exit! }

total_width = `stty size`.scan(/\d+/)[1].to_i
snowflakes_position = {}

loop do
  sleep 2
end

