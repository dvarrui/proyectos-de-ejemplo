#!/usr/bin/env ruby

require "gtk4"

window = Gtk::Window.new()
window.set_size_request(400, 400)
# window.set_border_width(10)

button = Gtk::Button.new(:label => "Say hello")
button.signal_connect "clicked" do |_widget|
  puts "Hello World!!"
end

window.set_child(button)
window.signal_connect("destroy") { |_widget| Gtk.main_quit }
window.show

