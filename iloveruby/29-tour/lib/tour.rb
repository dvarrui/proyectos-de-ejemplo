
require_relative 'tour/input'
require 'ruby2d'

data = Input.read(ARGV)

set title: data[:title]
show
