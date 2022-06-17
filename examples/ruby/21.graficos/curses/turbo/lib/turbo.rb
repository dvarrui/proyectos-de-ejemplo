
require "curses"
require_relative "textbox"

module Turbo
  extend Curses

  def self.init
    init_screen
    crmode
    cbreak
    noecho
    stdscr.keypad = true
    at_exit do
      Curses.close_screen
    end
    stdscr.box('|', "-")
    setpos(0,3); addstr(" TURBO (v0.1.0) ")
    setpos(24,3); addstr(" <Press 'ESC' to quit> ")
    build_boxes
  end

  def self.build_boxes
    boxes = []
    boxes << TextBox.new(x:7, y:4, w:9, h:9)
    boxes
  end

  def self.run
    boxes = init
    boxes[0].run
    close(boxes)
  end

  def self.close(boxes)
    close_screen
    boxes[0].debug
  end
end
