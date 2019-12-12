
require_relative 'tour/draw'
require_relative 'tour/input'
require 'ruby2d'

data = Input.read(ARGV)
current = 0
max = data[:slides].size - 1
@paint = []
@state = :slide
draw_slide(current, data[:slides])

on :key_down do |event|
  case event.key
    when 'left' # previous slide
      current -= 1 if current > 0
    when 'right' # next slide
      current += 1 if current < max
    when 'r' # reset
      current = 0
    when 'i' # show index
      @state = (@state == :slide ? :index : :slide )
      draw_index(data)
    when 'e' # exit
      exit 0
  end
  draw_slide(current, data[:slides]) if @state == :slide
end

set title: data[:title]
show
