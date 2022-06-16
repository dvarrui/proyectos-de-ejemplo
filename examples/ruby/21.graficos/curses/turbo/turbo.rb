#!/usr/bin/env ruby


require "curses"
include Curses

init_screen
crmode
noecho
stdscr.box('|', "-")
setpos(0,3)
addstr(" TURBO (v0.1.0) ")

setpos(24,3)
addstr(" <Press 'q' to quit> ")

loop do
  c = get_char
  case c
  when "q"
    return
  when "\e" # ESC
    return
  end
end

close_screen
