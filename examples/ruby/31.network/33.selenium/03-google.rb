#!/usr/bin/env ruby

require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
begin
  # Navigate to URL
  driver.get 'https://google.com'

  driver.find_element(id: 'L2AGLb').click
  # Enter "webdriver" text and perform "ENTER" keyboard action
  driver.find_element(name: 'q').send_keys 'webdriver', :return

  puts "Enter?"
  gets
ensure
  driver.quit
end
