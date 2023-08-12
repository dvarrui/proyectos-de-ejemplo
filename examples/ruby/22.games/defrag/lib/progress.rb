class Progress
  def initialize(screen)
    @screen = screen
    @duration = 0.0
  end

  def update(delta)
    @duration += delta
    @min = format("%02d", @duration/60).on_blue
    @seg = format("%02d", (@duration - (@duration/60).to_i * 60)).on_blue
  end

  def render
    @screen.show 28, @screen.height - 3, @min
    @screen.show 31, @screen.height - 3, @seg
  end
end
