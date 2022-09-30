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
      puts "    [Window] #{driver.title}"
      puts "==> click #{button.text}"
      button.click
      return true
    end
  end

  driver.quit
  puts "[ERROR] #{text} button not found!"
  exit 1
end

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"
CODE = "38260"

driver = Selenium::WebDriver.for :firefox
driver.get URL
driver.manage.timeouts.implicit_wait = 30


click_button("SALTAR", driver)

driver.navigate.refresh
driver.find_element(name: 'Zip').send_keys CODE, :return
puts "==> send_keys Zip"

handles = driver.window_handles
driver.switch_to.window(handles[1])

pause

driver.quit
