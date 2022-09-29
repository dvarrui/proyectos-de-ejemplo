#!/usr/bin/env ruby

require "selenium-webdriver"
require "debug"

def pause
  puts "(Push enter to continue)"
  gets
end

def click_button(text, driver)
  driver.find_elements(:tag_name, 'button').each do |button|
    if button.text == text
      puts "==> click #{button.text}"
      button.click
      return true
    end
    # puts "    * button... #{button.text}" unless button.text.size.zero?
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

click_button("SALTAR", driver)

driver.navigate.refresh

select_element = driver.find_element(name: "Radius")
select = Selenium::WebDriver::Support::Select.new(select_element)
select.select_by(:text,'100 km')

driver.find_element(name: 'Zip').send_keys CODE, :return
puts "==> send_keys Zip"

pause

puts "Leer la segunda ventana"
handles = driver.window_handles
driver.switch_to.window(handles[1])
puts "    - Title \"#{driver.title}\""
click_button("Continuar", driver)

pause

# driver.find_element(:class, "mod-region-selector__dropdown textfield__control").click

# text_box = driver.find_element(:name, "Zip") # Selects element by its name
# text_box.send_keys("38000") # Type in the box
driver.quit
