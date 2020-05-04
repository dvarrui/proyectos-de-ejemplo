
require_relative '../adventure'

class Room
  attr_accessor :id
  attr_accessor :name
  attr_accessor :desc
  attr_accessor :doors

  def initialize(args = {})
    @id = args[:id] if args[:id]
    @name = args[:name] if args[:name]
    @desc = args[:desc] if args[:desc]
    @doors = args[:doors] if args[:doors]
  end

  def show
    puts "\n"
    puts @desc

    items = Adventure.instance.items_per_site[Adventure.instance.get_actor('player').room]
    items.each { |i| Adventure.instance.get_item(i).show }

    return if @doors.nil?
    puts "Puedes ir a:"
    @doors.each_key { |key| puts " - #{key}"}
  end
end
