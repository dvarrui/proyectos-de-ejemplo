#!/usr/bin/env ruby
# https://www.devdungeon.com/content/get-password-console-ruby

require 'io/console'

# The prompt is optional
password = IO::console.getpass "Enter Password: "
sleep 5
puts "Your password was #{password.length} characters long."
