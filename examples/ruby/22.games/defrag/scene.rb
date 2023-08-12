require_relative "lib/panel"
require_relative "lib/progress"

class Scene
  attr_accessor :screen

  def init
    @symbol = {
      space: " ".on_blue,
      # block: " ".on_green,
      used1: "\u25cf".blue.on_light_yellow,
      used2: "\u25cf".blue.on_light_white,
      unused: "\u26c6".blue.on_white,
      reading: "R".light_white.on_blue,
      writting: "W".light_white.on_blue,
      bad: "B".light_white.on_blue,
      unmovable: "X".light_white.on_blue,
    }
    @panel = Panel.new(@screen, @symbol)
    @progress = Progress.new(@screen)
  end

  def update(delta)
    @panel.update(delta)
    @progress.update(delta)
  end

  def render
    @panel.render
    @progress.render
    @symbol.values.each_with_index do |s, index|
      @screen.show 2+index, 2, s
    end
  end
end
