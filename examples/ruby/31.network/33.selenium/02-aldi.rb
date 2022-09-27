#!/usr/bin/env ruby

require "selenium-webdriver" 
require "debug"

def pause
  puts "Push enter to continue"
  gets
end

url = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"

driver = Selenium::WebDriver.for :firefox
driver.navigate.to url

elements = driver.find_elements(:tag_name, 'button')
elements.each do |e| 
  
  if e.text.size > 1
    puts e.text
    e.click if e.text=="SALTAR"
  end
end
  
pause

# driver.find_element(:class, "mod-region-selector__dropdown textfield__control").click 

# text_box = driver.find_element(:name, "Zip") # Selects element by its name
# text_box.send_keys("38000") # Type in the box

sleep(10000)
driver.quit
