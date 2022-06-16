
require "curses"
require_relative "textbox"

module Turbo
  extend Curses

  def self.init
    init_screen
    crmode
    noecho
    stdscr.box('|', "-")
    setpos(0,3); addstr(" TURBO (v0.1.0) ")
    setpos(24,3); addstr(" <Press 'q' to quit> ")
  end

  def self.run
    init

    textbox = TextBox.new(x:5, y:5, w:10, h:10)
    textbox.run
    close
  end

  def self.close
    close_screen
  end
end
