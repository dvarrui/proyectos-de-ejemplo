#!/usr/bin/env ruby
# frozen_string_literal: true
# URL. https://www.youtube.com/watch?v=nnoYJxaFw3Q

require "io/console"
require "colorize"

# micro-framework to manipulate the cursor

def clear_screen = puts "\033[2J"
def move_cursor(x, y) = print "\033[#{y};#{x}H"
def move_cursor_top_left = move_cursor(0, 0)
def total_height = @total_height ||= `stty size`.scan(/\d+/)[0].to_i
def total_width = @total_width ||= `stty size`.scan(/\d+/)[1].to_i

block = "#".red.on_light_white
head_block = "#".light_white.on_red

positions = [
  [total_width/2, total_height/2],
  [total_width/2 + 1, total_height/2],
  [total_width/2 + 2, total_height/2],
  [total_width/2 + 3, total_height/2],
]

loop do
end
