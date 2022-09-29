#!/usr/bin/env ruby

require "selenium-webdriver"
require "debug"

def pause
  puts "(Push enter to continue)"
  gets
end

def get_button(text, driver)
  driver.find_elements(:tag_name, 'button').each do |button|
    return button if button.text == text
  end
  puts "[ERROR] Button #{text} not found!"
  exit 1
end

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"

driver = Selenium::WebDriver.for :firefox
driver.get URL
driver.manage.timeouts.implicit_wait = 30

b = get_button("SALTAR", driver)
puts "==> click #{b.text}"
b.click

driver.find_element(name: 'Zip').send_keys '38000'
puts "==> send_keys Zip"

b = get_button("Buscar", driver)
puts "==> click #{b.text}"
b.click

pause

# driver.find_element(:class, "mod-region-selector__dropdown textfield__control").click

# text_box = driver.find_element(:name, "Zip") # Selects element by its name
# text_box.send_keys("38000") # Type in the box
driver.quit
