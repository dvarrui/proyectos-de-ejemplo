#!/usr/bin/env ruby

require_relative "lib/selenium-wrapper"
require 'debug'

URL = "https://www.airbnb.es/s/canaras/homes?tab_id=home_tab&search_type=search_query&refinement_paths%5B%5D=%2Fhomes&query=Canary%20Islands%2C%20Spain&flexible_trip_lengths%5B%5D=one_week&price_filter_input_type=0&price_filter_num_nights=5&pagination_search=true&cursor=eyJzZWN0aW9uX29mZnNldCI6MCwiaXRlbXNfb2Zmc2V0IjowLCJ2ZXJzaW9uIjoxfQ%3D%3D"

browser = SeleniumWrapper.new(URL)
puts "[Title] #{browser.driver.title}"

driver = browser.driver
ids = []
driver.find_elements(:tag_name, "div").map do |div|
  id = div.attribute("id")
  if id.start_with? "title_"
    system("echo id >> airbnb.log")
    binding.break
    ids << id
  end
end
puts ids.size

browser.quit
