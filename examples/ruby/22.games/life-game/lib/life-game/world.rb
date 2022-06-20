

class World
  attr_accessor :output
  attr_reader :step

  def initialize(x:, y:, filename:)
    @step = 0
    @pos = Struct.new(:x, :y).new(x, y)

    @filename = filename
    @data =  %w(0 0 0 0 0 0 0 0 0 0)
    @data << %w(0 0 0 0 0 0 1 1 0 0)
    @data << %w(0 0 1 0 0 0 0 1 0 0)
    @data << %w(0 0 1 1 0 0 0 0 0 0)
    @data << %w(0 0 0 0 0 0 1 1 0 0)
    @data << %w(0 0 1 0 0 0 0 0 0 0)
    @data << %w(0 0 1 0 0 1 0 0 0 0)
    @data << %w(0 0 1 0 0 0 0 0 0 0)

    w = @data.first.size
    h = @data.size
    @size = Struct.new(:w, :h).new(w, h)
  end

  def render
    x = @pos.x
    y = @pos.y
    @output.print_at("?", x, y)
  end

  def update
    @step += 1
  end

end
