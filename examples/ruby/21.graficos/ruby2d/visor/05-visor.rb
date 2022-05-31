#!/usr/bin/env ruby

require 'ruby2d'

def configuration(version:)
  set title: "visor #{version} (ruby2d)"
  set background: 'blue'
  @image = nil
end

def load_images
  dirbase = File.join(File.dirname(__FILE__), '..', 'images')
  Dir.glob(dirbase + '/*')
end

def show_image(filepath)
  filename = File.basename(filepath)
  text = Text.new("Filename: #{filename}", x: 50, y: 50, size: 40, color: 'white', z: 10)
  if @image.nil?
    @image = Image.new(filepath, x: 50, y: 100)
  else
    @image.path = filepath
  end
end

def process_input
  images = load_images
  index = 0
  show_image(images[index])
    on :key_down do |event|
    if ['q', 'escape', 'e'].include? event.key
      close
    elsif event.key == 'right'
      index += 1
      index = 0 if index == images.size
    elsif event.key == 'left'
      index -= 1
      index = (images.size - 1) if index < 0
    end
    show_image(images[index])
  end
end


configuration(version: 'v05')
@images = load_images
process_input
show
