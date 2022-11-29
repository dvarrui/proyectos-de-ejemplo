#!/usr/bin/env ruby
require "debug"
require "dotenv"
require "nextcloud"

settings = Dotenv.load

nextcloud = Nextcloud.new(
  url: settings["URL"],
  username: settings["USERNAME"],
  password: settings["PASSWORD"]
)

ocs = nextcloud.ocs
webdav = nextcloud.webdav
binding.break
