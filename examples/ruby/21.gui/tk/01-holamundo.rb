#!/usr/bin/env ruby
require "tk"

root = TkRoot.new { title "10-holamundo tk" }
TkLabel.new(root) {
  text  "Hola, Mundo!"
  pack  { padx 15 ; pady 15; side "left" }
}
Tk.mainloop

