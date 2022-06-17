
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
        key_down
      when Curses::KEY_UP
        key_up
      when Curses::KEY_BACKSPACE
        key_backspace
      when Curses::KEY_LEFT
        key_left
      when Curses::KEY_RIGHT
        key_right
      else
        add_char(ch)
      end
      render
      pos = global_position
      Curses.setpos(pos.y, pos.x);
      Curses.addstr('')
    end
  end

  def render
    @data.each_with_index do |line, index|
      y = @position.y + index
      x = @position.x
      Curses.setpos(y, x)
      Curses.addstr(line + " ")

      Curses.setpos(y, x - 5)
      Curses.addstr("%3d:" % (index+1) )
    end
    internal_debug
  end

  def debug
    @data.each_with_index do |line, index|
      puts " #{index} : #{line}"
    end
  end

  private

  def internal_debug
    point_class = Struct.new(:x, :y)
    pos = point_class.new( @position.x + @cursor.x,
                           @position.y + @cursor.y )
    msg = "Position : box(#{@position.x},#{@position.y}) " \
          "cursor(#{@cursor.x},#{@cursor.y}) " \
          "global(#{pos.x},#{pos.y})  "
    Curses.setpos(1,3); Curses.addstr(msg)
    line = @data[@cursor.y]
    msg = "Data     : lines=#{@data.size}, current_line=<#{line}>, size=#{line.size}      "
    Curses.setpos(2,3); Curses.addstr(msg)
    pos
  end

  def global_position
    point_class = Struct.new(:x, :y)
    pos = point_class.new( @position.x + @cursor.x,
                           @position.y + @cursor.y )
    pos
  end

  def key_down
    return if @cursor.y >= @size.h

    @cursor.x = 0
    @cursor.y += 1
    @data << "" if @data[@cursor.y].nil?
  end

  def key_up
    return if @cursor.y.zero?

    @cursor.x = 0
    @cursor.y -= 1
    return ''  end

  def key_backspace
    return if @cursor.x.zero?

    @cursor.x -= 1
  end

  def key_left
    return if @cursor.x.zero?

    @cursor.x -= 1
  end

  def key_right
    return if @cursor.x < @size.w

    @cursor.x += 1 if @cursor.x < @data[@cursor.y].size
  end

  def add_char(ch)
    return if @cursor.x >= @size.w

    @data[@cursor.y] << ch
    @cursor.x += 1
  end
end
