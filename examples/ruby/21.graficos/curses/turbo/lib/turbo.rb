
require "curses"

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

    @pos = { x:10, y:10 }
    loop do
      c = get_char
      case c
      when "q"
        return
      when "\e" # ESC
        return
      else
        setpos(@pos[:y], @pos[:x]); addstr(c)
        @pos[:x] += 1
      end
    end
    close_screen
  end
end 


