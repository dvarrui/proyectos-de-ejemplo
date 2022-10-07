#!/usr/bin/env ruby

require_relative "06-airbnb-lib"
require 'debug'

URL = "https://www.airbnb.es"

browser = Airbnb.new(URL)
# browser.click_button("Vale", debug: true)
browser.click_button_attr("class", "f19g2zq0 dir dir-ltr", debug: true)
browser.filter_destino("Canarias, España")
browser.pause
