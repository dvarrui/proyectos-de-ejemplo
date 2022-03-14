
class Draw
  def initialize(window)
    @window = window
  end

  def text_at(text, x, y)
    @window.setpos(x, y)
    @window.addstr(text.to_s)
  end
end
