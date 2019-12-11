
require_relative 'tour/draw'
require_relative 'tour/input'
require 'ruby2d'

data = Input.read(ARGV)
current = 0
max = data[:slides].size - 1
@paint = []
draw_slide(current, data[:slides])

on :key_down do |event|
  case event.key
    when 'left' # previous slide
      current -= 1
    when 'right' # next slide
      current += 1
    when 'i' # show index
      draw_index(data)
    when 'r' # reset
      current = 0
  end
  current = 0 if current < 0
  current = max if current > max
  draw_slide(current, data[:slides])
end

set title: data[:title]
show
