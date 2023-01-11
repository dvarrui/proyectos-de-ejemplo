#!/usr/bin/env ruby
require "gtk4"

app = Gtk::Application.new()
app.signal_connect("activate") do |i|
  win = Gtk::ApplicationWindow.new(i)
  win.present()
end

app.run()
