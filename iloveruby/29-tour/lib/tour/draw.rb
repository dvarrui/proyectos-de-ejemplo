require 'ruby2d'

def draw_slide(current, slides)
  slide = slides[current]
  @paint.each { |i| i.remove }
  title = Text.new(slide[:title],
    x: 40, y: 20, z: 20, size: 70, color: 'white' )
  @paint << title
  index = Text.new("#{slide[:index]}/#{slides.size}",
      x: Window.width - 40, y: Window.height - 40, z: 30,
      size: 20, color: 'white' )
  @paint << index
  slide[:lines].each_with_index do |line, index|
    line = Text.new(line,
        x: 100, y: (130 + 60 * index), z: 10,
        size: 50, color: 'white' )
    @paint << line
  end
end
