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

places = driver.find_elements(xpath: '//div[@class="pol-12"]')
places.each do |div|
  index += 1
  h = div.find_element(xpath: 'descendant::h3')
  puts format("%3d", index) + " " + h.text
  addr = div.find_element(xpath: 'descendant::li[@class="sl-addr"]/span').text
  phone = div.find_element(xpath: 'descendant::li[@class="sl-phone"]/a').text
  email = div.find_element(xpath: 'descendant::li[@class="sl-email"]/a').text
  days = div.find_element(xpath: 'descendant::span[@class="asl-day-lbl"]').text
  puts "     addr: #{addr.gsub("\n", " - ")}"
  puts "    phone: #{phone}"
  puts "    email: #{email}"
  puts "     days: #{days}"

  # h.find_elements(xpath: "descendant::a").each do |a|
  #   puts "      #{a.text}"
  # end
end

# driver.find_elements(:tag_name, "h3").each do |e|

driver.quit
exit 0
