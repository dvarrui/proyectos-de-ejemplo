require_relative 'term_window'
require_relative 'output'
require_relative 'input'
require_relative 'world'

class Game
  attr_reader :window

  def initialize(filename)
    @window = TermWindow.new(20, 60)
    @input = Input.new(window)
    Output.init
    @output = Output.new(window)

    @world = World.new(x: 5, y: 5, filename: filename)
  end

  def play
    key = @input.key
    while (key != 27)
      render
      window.timeout = 150

      key = @input.update
    end
    gameover
  end

  private

  def render
    @output.print_at(" LifeGame ", 0, 2)
    @output.print_at(" (Press ESC to exit) ", 19, 2)
    @output.print_at(" Steps: %d " % @world.step, 19, @window.width - 15)
  end

  def update
  end

  def gameover
    Output.close

    puts("----- GAME OVER -----")
  end
end
