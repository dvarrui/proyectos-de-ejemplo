

class World
  attr_accessor :output
  attr_reader :step
  attr_reader :origin

  def initialize(x:, y:, filename:)
    @step = 0
    @origin = Struct.new(:x, :y).new(x, y)

    @filename = filename
    @data = []
    @data <<  '0 0 0 0 0 0 0 0 0 0'
    @data <<  '0 0 0 0 0 1 1 1 0 0'
    @data <<  '0 0 0 0 0 0 0 0 0 0'
    @data <<  '0 0 1 0 0 0 0 0 0 0'
    @data <<  '0 0 1 0 0 0 0 0 1 0'
    @data <<  '0 0 1 1 1 0 0 0 1 0'
    @data <<  '0 0 0 0 0 0 0 0 1 0'
    @data <<  '0 0 0 0 0 0 0 0 0 0'
  end

  def render
    @data.each_with_index do |line, index|
      @output.print_at(line, origin.y + index, origin.x)
    end
  end

  def update
    @step += 1
  end

end
