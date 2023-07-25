#!/usr/bin/env ruby

require "selenium-webdriver"

options = Selenium::WebDriver::Firefox::Options.new
options.add_argument("-headless")
driver = Selenium::WebDriver.for :firefox, options: options

url = "https://cooperativa.unidesupermercados.es/establecimientos/"
driver.manage.timeouts.implicit_wait = 30
driver.get url

puts "[Title] #{driver.title}"
index = 0
driver.find_elements(:tag_name, "h3").each do |e|
  index += 1
  puts format("%3d", index) + " " + e.text
  # e.find_elements(:tag_name, "a").each do |a|
  #   puts "      #{a.text}"
  # end
end

driver.quit
exit 0
