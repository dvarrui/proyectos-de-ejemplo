
require 'curses'

class TextBox
  attr_reader :data

  def initialize(x:, y:, w:, h:)
    point_class = Struct.new(:x, :y)
    @position = point_class.new(x, y)
    size_class = Struct.new(:w, :h)
    @size = size_class.new(w, h)
    @cursor = point_class.new(0, 0)
    @data = [ '', '' ]
  end

  def run
    loop do
      ch = Curses.get_char
      case ch
      when "\e" # ESC
        return
      when Curses::KEY_DOWN
        ch = key_down
      when Curses::KEY_UP
        ch = key_up
      when Curses::KEY_BACKSPACE
        ch = ''
        next if @cursor.x.zero?

        @cursor.x -= 1
      when Curses::KEY_LEFT
        ch = ''
        next if @cursor.x.zero?

        @cursor.x -= 1
      when Curses::KEY_RIGHT
        ch = ''
        next if @cursor.x < @size.w

        @cursor.x += 1 if @cursor.x < @data[@cursor.y].size
      else
        save = ch
        ch = ''
        next if @cursor.x > @size.w

        ch = save
        @data[@cursor.y] << ch
        @cursor.x += 1
      end
      render
      pos = global_position
      Curses.setpos(pos.y, pos.x + 1);
      Curses.addstr('#')
    end
  end

  def render
    @data.each_with_index do |line, index|
      y = @position.y + index
      x = @position.x
      Curses.setpos(y, x)
      Curses.addstr(line + " ")
    end
  end

  def debug
    @data.each_with_index do |line, index|
      puts " #{index} : #{line}"
    end
  end

  private

  def global_position
    point_class = Struct.new(:x, :y)
    pos = point_class.new( @position.x + @cursor.x,
                           @position.y + @cursor.y )
    Curses.setpos(3,3)
    Curses.addstr("(#{pos.x}, #{pos.y}) ")
    pos
  end

  def key_down
    return '' if @cursor.y > @size.h

    @cursor.x = 0
    @cursor.y += 1
    @data << "" if @data[@cursor.y].nil?
    return ''
  end

  def key_up
    return '' if @cursor.y.zero?

    @cursor.x = 0
    @cursor.y -= 1
    return ''
  end
end
