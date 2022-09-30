#!/usr/bin/env ruby

require_relative "05-aldi-lib"

CODE = "38260"

puts AldiPhoneNumber.new.get(CODE)
