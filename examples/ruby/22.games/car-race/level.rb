require_relative "world"
require_relative "player"

class Level
  def initialize(screen)
    @screen = Screen.new
    @world = World.new(screen)
    @player = Player.new(screen)
    @player.x = 60
    @player.y = 20
  end

  def update(delta)
    @world.update
    @player.update
  end

  def render
    @world.render
    @player.render
  end
end
