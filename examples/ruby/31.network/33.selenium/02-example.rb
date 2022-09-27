#!/usr/bin/env ruby

require "selenium-webdriver" # set webdriver gem for Selenium

url = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"

driver = Selenium::WebDriver.for :firefox # driver object creation
driver.navigate.to url

# text_box = driver.find_element(:name, "Zip") # Selects element by its name
# text_box.send_keys("38000") # Type in the box

sleep(10)

