#!/usr/bin/env ruby
# https://www.tutorialspoint.com/how-do-i-use-selenium-with-ruby

require "selenium-webdriver" # set webdriver gem for Selenium
require "rubygems"

puts "Step 1/3"
driver = Selenium::WebDriver.for :firefox # driver object creation

puts "Step 2/3"
driver.navigate.to "https://www.tutorialspoint.com/index.htm" # launch browser

puts "Step 3/3"
driver.close # close browser

