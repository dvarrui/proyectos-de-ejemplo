require 'ruby2d'

def remove_drawing(paint)
  paint.each { |i| i.remove }
end

def draw_slide(current, slides)
  slide = slides[current]
  remove_drawing(@paint)
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

def draw_index(data)
  remove_drawing(@paint)
  data[:slides].each do |item|
    text = Text.new("#{item[:index]}. #{item[:title]}",
                    x: 100, y: (40 + 50 * item[:index]), z: 10,
                    size: 30, color: 'white' )
    @paint << text
  end
end
