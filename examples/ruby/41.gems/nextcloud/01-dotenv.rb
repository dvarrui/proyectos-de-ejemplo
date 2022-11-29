#!/usr/bin/env ruby

require "dotenv"
require "nextcloud"

settings = Dotenv.load("private.env")
puts settings
