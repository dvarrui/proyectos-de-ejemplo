#!/usr/bin/env ruby

require_relative "06-airbnb-lib"
require 'debug'

# URL = "https://www.airbnb.es"
URL = "https://www.airbnb.es/s/Canarias--Espa%C3%B1a/homes?tab_id=home_tab&source=structured_search_input_header&search_type=filter_change"

browser = Airbnb.new(URL)
puts "[Save page] #{browser.driver.title}"
browser.click_link("2", debug: true)
puts "[Save page] #{browser.driver.title}"
