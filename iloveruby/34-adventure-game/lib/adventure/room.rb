
require_relative '../adventure'

class Room
  attr_accessor :id
  attr_accessor :name
  attr_accessor :desc
  attr_accessor :doors

  def initialize(id, args = {})
    @id = id
    @desc = args[:desc] if args[:desc]
    @doors = args[:doors] if args[:doors]
  end

  def items
    a = []
    Adventure.instance.items.each_value { |i| a << i if i.room == @id }
    a
  end

  def show
    puts "\n"
    puts @desc

    items.each { |i| i.show }

    return if @doors.nil?
    puts "Puedes ir a:"
    @doors.each_key { |key| puts " - #{key}"}
  end
end
