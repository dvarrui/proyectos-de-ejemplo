#!/usr/bin/env ruby

require_relative "07-alcampo-lib"
require 'debug'

URL = "https://www.alcampo.es/empresa/tiendas"

browser = Alcampo.new(URL)
puts "[Save page] #{browser.driver.title}"
browser.pause
