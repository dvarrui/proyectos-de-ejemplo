#!/usr/bin/env ruby
# frozen_string_literal: true
# URL. https://www.youtube.com/watch?v=nnoYJxaFw3Q

require "io/console"
require "colorize"
require "debug"

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

$direction = "d"
Thread.new do
  STDIN.noecho do |io|
    while c = io.getch.tap { |char| exit(1) if char == "\e" }
      if %w(a d).include?($direction) && %w(w s).include?(c.chr)
        $direction = c.chr
      elsif %w(w s).include?($direction) && %w(a d).include?(c.chr)
        $direction = c.chr
      end
    end
  end
end

loop do
  x, y = positions.last
  positions.push(
    case $direction
    when "w" then y.positive? ? [x, y-1] : [x, total_height]
    when "s" then y < total_height ? [x, y+1] : [x, 0]
    when "a" then x.positive? ? [x-1, y] : [total_width, y]
    when "d" then x < total_width ? [x+1, y] : [0, y]
    end
    )
  positions.shift

  clear_screen
  head = positions.last
  positions[0..-2].each do |x, y|
    move_cursor(x, y)
    print block
  end

  # binding.break
  move_cursor *head
  print head_block

  move_cursor_top_left
  sleep 0.1
end
