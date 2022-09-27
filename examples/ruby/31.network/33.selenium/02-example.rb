#!/usr/bin/env ruby

require "selenium-webdriver" # set webdriver gem for Selenium

url = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to url

driver.get url
elements = driver.find_elements(:tag_name, 'li')
elements.each { |e| puts e.text }
  
# driver.find_element(:class, "mod-region-selector__dropdown textfield__control").click 

# text_box = driver.find_element(:name, "Zip") # Selects element by its name
# text_box.send_keys("38000") # Type in the box

sleep(10000)
driver.quit
