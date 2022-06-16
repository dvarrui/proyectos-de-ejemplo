
require 'curses'

class TextBox
  attr_reader :data

  def initialize(x:, y:, w:, h:)
    @box_position = { x: x, y: y }
    @box_size = { w: w, h: h }
    @prompt = { x: 0, y: 0 }
    @data = [ '', '' ]
  end

  def run
    loop do
      ch = Curses.get_char
      case ch
      when "q"
        return
      when Curses::KEY_DOWN
        ch = ''
        next if @prompt[:y] > @box_size[:h]
        @prompt[:y] += 1
        @prompt[:x] = 1
        @data << '' if @data[@prompt[:y]].nil?
      when Curses::KEY_UP
        ch = ''
        next if @prompt[:y].zero?
        @prompt[:y] -= 1
        @prompt[:x] = 1
      when Curses::KEY_BACKSPACE
        ch = ''
        next if @prompt[:x].zero?
        @prompt[:x] -= 1
      when Curses::KEY_LEFT
        ch = ''
        next if @prompt[:x].zero?
        @prompt[:x] -= 1
      when Curses::KEY_RIGHT
        ch = ''
        next if @prompt[:x] < @box_size[:w]
        @prompt[:x] += 1
      else
        next if @prompt[:x] > @box_size[:w]
        @data[@prompt[:y]] << ch
        @prompt[:x] += 1
      end
      pos = global_position
      Curses.setpos(pos[:y], pos[:x]);
      Curses.addstr(ch.to_s)
    end
  end

  def debug
    @data.each_with_index do |line, index|
      puts " #{index} : #{line}"
    end
  end

  private

  def global_position
    pos = { x: @box_position[:x] + @prompt[:x],
            y: @box_position[:y] + @prompt[:y] }
    Curses.setpos(3,3)
    Curses.addstr("(#{pos[:x]}, #{pos[:y]})")
    pos
  end

end
