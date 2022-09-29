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
    puts "[INFO] #{button.text} button exist!" unless button.text.size.zero?
  end

  driver.quit
  puts "[ERROR] #{text} button not found!"
  exit 1
end

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"
CODE = "38000"

driver = Selenium::WebDriver.for :firefox
driver.get URL
driver.manage.timeouts.implicit_wait = 30

puts "    - Title \"#{driver.title}\""

b = get_button("SALTAR", driver)
puts "==> click #{b.text}"
b.click

s = driver.find_element(name: "Radius")
#s.select_by(:text,'100 km')

driver.find_element(name: 'Zip').send_keys CODE, :return
puts "==> send_keys Zip"

pause

puts "Leer la segunda ventana"
handles = driver.window_handles
driver.switch_to.window(handles[1])
puts "    - Title \"#{driver.title}\""
b = get_button("Continuar", driver)
puts "==> click #{b.text}"
b.click

pause

# driver.find_element(:class, "mod-region-selector__dropdown textfield__control").click

# text_box = driver.find_element(:name, "Zip") # Selects element by its name
# text_box.send_keys("38000") # Type in the box
driver.quit
