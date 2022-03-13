require 'curses'
require_relative 'draw'
require_relative 'input'

class Game
  INVISIBLE_CURSOR = 0

  attr_reader :window, :snake

  def initialize
    @window = TermWindow.new
    # Create Snake with coordenates of every slide (3 slides at beginning)
    @snake = Snake.new([[4,10], [4,9], [4,8]])
    # TODO: It could be interesting... play with several players (snakes)
    @input = Input.new(window)
    @draw = Draw.new(window)
  end

  def create
    Curses.init_screen()
    Curses.cbreak()
    Curses.noecho
    Curses.curs_set(INVISIBLE_CURSOR)

    play_loop
  end

  private

  def play_loop
    score = 0

    food = Food.new(window)
    food.relocate_without_conflict!(@snake)
    window.paint_food(food)

    key = @input.key
    while (key != 27)
      @draw.text_at(" SnakeGame ", 0, 5)
      @draw.text_at(" Score: #{score.to_s} ", 0, window.width - 15)
      window.timeout = 150
      key = @input.update

      case key
      when Curses::KEY_DOWN
        @snake.insert(0, [@snake[0][0], @snake[0][1] + 1])
      when Curses::KEY_UP
        @snake.insert(0, [@snake[0][0], @snake[0][1] - 1])
      when Curses::KEY_LEFT
        @snake.insert(0, [@snake[0][0] - 1, @snake[0][1]])
      when Curses::KEY_RIGHT
        @snake.insert(0, [@snake[0][0] + 1, @snake[0][1]])
      end

      @snake[0][0] = (window.width.to_i - 2) if @snake[0][0] == 0
      @snake[0][1] = (window.height.to_i - 2) if @snake[0][1] == 0
      @snake[0][0] = 1 if @snake[0][0] == window.width - 1
      @snake[0][1] = 1 if @snake[0][1] == window.height - 1

      if @snake.crashed?
        break
      end

      if food.has_been_eaten_by?(@snake)
        score += food.points
        food = Food.new(window)
        food.relocate_without_conflict!(@snake)
        window.paint_food(food)
      else
        last_part = @snake.pop
        window.setpos(last_part[1], last_part[0])
        window.addstr(' ')
      end

      window.paint_snake(@snake)
    end

    window.close
    Curses.close_screen

    puts("----- GAME OVER -----")
    puts("----- Score: #{score} -----")
  end
end
