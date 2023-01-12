#!/usr/bin/env ruby

require_relative "lib/utils"

require_gtk4

app = Gtk::Application.new("org.gtk.example", :flags_none)
ui = "05-glade.ui"

app.signal_connect "activate" do
  builder = Gtk::Builder.new(file: File.join(__dir__, ui))

  window = builder["window"]
  window.set_application(app)

  button = builder["btn_newconcept"]
  button.signal_connect("clicked") { puts "Hello World!" }

  window.show
end

app.run
