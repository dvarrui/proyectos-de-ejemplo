class Scene
  attr_accessor :screen

  def init
    @panel = File.read("panel.txt").on_blue
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
    @state = :init
  end

  def update(delta)
  end

  def render
    if @state == :init
      fill_screen
      show_panel
      @state = :running
    end
    @symbol.values.each_with_index do |s, index|
      @screen.show 2+index, 2, s
    end
  end

  private

  def fill_screen
    (1..@screen.height).each do |y|
      (1..@screen.width).each do |x|
        @screen.show x, y, @symbol[:space]
      end
    end
  end

  def show_panel
    y = @screen.height - 6
    x = 45
    @screen.show 1, y, @panel
    @screen.show x, y + 1, @symbol[:used2]
    @screen.show x + 17, y + 1, @symbol[:unused]
    @screen.show 17, y, " Status ".light_yellow.on_blue
    @screen.show 57, y, " Legend ".light_yellow.on_blue
  end
end
