require 'ruby2d'

def remove_drawing(paint)
  paint.each { |i| i.remove }
end

def draw_slide(current, data)
  slide = data[:slides][current]
  remove_drawing(@paint)
  title = Text.new(slide[:title],
          x: 40, y: 20, z: 20,
          size: 60, color: 'white' )
  @paint << title

  slide[:lines].each_with_index do |line, index|
    line = Text.new(line,
        x: 100, y: (130 + 60 * index), z: 10,
        size: 40, color: 'white' )
    @paint << line
  end

  time = Text.new(data[:time],
          x: 10, y: Window.height - 40, z: 30,
          size: 20, color: 'white' )
  @paint << time

  index = Text.new("#{slide[:index]}/#{data[:slides].size}",
          x: Window.width - 40, y: Window.height - 40, z: 30,
          size: 20, color: 'white' )
  @paint << index
end

def draw_index(data)
  remove_drawing(@paint)
  data[:slides].each do |item|
    text = Text.new("#{item[:index]}. #{item[:title]}",
                    x: 100, y: (20 + 50 * item[:index]), z: 10,
                    size: 30, color: 'white' )
    @paint << text
  end
end
