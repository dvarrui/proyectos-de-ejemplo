
require "curses"
require_relative "textbox"

module Turbo
  extend Curses

  def self.init
    init_screen
    crmode
    Curses.cbreak
    noecho
    Curses.stdscr.keypad = true
    at_exit do
      Curses.close_screen
    end
    stdscr.box('|', "-")
    setpos(0,3); addstr(" TURBO (v0.1.0) ")
    setpos(24,3); addstr(" <Press 'q' to quit> ")
  end

  def self.run
    init

    textbox = TextBox.new(x:5, y:5, w:9, h:9)
    textbox.run
    close
    textbox.debug
  end

  def self.close
    close_screen
  end
end
