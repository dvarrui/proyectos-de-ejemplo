
require_relative 'life-game/game'

module LifeGame

  def self.play(filename)
    Game.new.play
  end

end
