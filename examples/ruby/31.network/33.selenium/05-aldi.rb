#!/usr/bin/env ruby

require_relative "05-aldi-lib"

CODE = "38670"

puts AldiPhoneNumber.new.get(CODE)
