#!/usr/bin/env ruby
# https://www.tutorialspoint.com/how-do-i-use-selenium-with-ruby

require "selenium-webdriver" # set webdriver gem for Selenium
require "rubygems"
driver = Selenium::WebDriver.for :chrome # driver object creation
driver.navigate.to "https://www.tutorialspoint.com/index.htm" # launch browser
driver.close # close browser

