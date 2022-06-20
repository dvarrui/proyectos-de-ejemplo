require_relative 'term_window'
require_relative 'output'
require_relative 'input'

class Game
  attr_reader :window

  def initialize
    @window = TermWindow.new(20, 60)
    @input = Input.new(window)
    Output.init
    @output = Output.new(window, false)

    # Create Snake with coordenates of every slide (3 slides at beginning)
    # TODO: It could be interesting... play with several players (snakes)
    @cells = %w(0 0 0 0 1 1 1 0 0 0)
    @step = 0
  end

  def play
    key = @input.key
    while (key != 27)
      render
      window.timeout = 150

      key = @input.update
      case key
      when 27
        gameover
      end
    end
    gameover
  end

  private

  def render
    @output.print_at(" LifeGame - (Press ESC to exit) ", 0, 2)
    @output.print_at(" Steps: %d " % @step, 19, @window.width - 15)
  end

  def update
  end

  def gameover
    Output.close

    puts("----- GAME OVER -----")
  end
end
