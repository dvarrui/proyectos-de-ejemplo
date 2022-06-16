
require 'curses'

class TextBox
  attr_reader :data
  
  def initialize(x:, y:, w:, h:)
    @box_position = { x: x, y: y }
    @box_size = { w: w, h: h }
    @prompt = { x: 0, y: 0 }
    @data = [ '' ]
  end

  def run
    loop do
      ch = Curses.get_char
      case ch
      when "q"
        return
      when Curses::KEY_DOWN
        @prompt[:y] += 1
      else
        @data[@prompt[:y]] << ch
        pos = global_position
        Curses.setpos(pos[:y], pos[:x]);
        Curses.addstr(ch)
        @prompt[:x] += 1
      end
    end
  end

  private

  def global_position
    { x: @box_position[:x] + @prompt[:x],
      y: @box_position[:y] + @prompt[:y] }
  end

end
