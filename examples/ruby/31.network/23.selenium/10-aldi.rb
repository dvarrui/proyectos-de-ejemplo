#!/usr/bin/env ruby

require "colorize"
require "selenium-webdriver"

def pause
  puts "(Push enter to continue)".colorize(:light_yellow)
  gets
end

options = Selenium::WebDriver::Firefox::Options.new
# options.add_argument("-headless")
driver = Selenium::WebDriver.for :firefox, options: options

# https://www.aldi.es/supermercados/encuentra-tu-supermercado.html
# url = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html/s?q=Canarias%2C%20Espa%C3%B1a"
url = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html"
driver.manage.timeouts.implicit_wait = 30
driver.get url
puts "[Title] #{driver.title}"

sleep 6
handles = driver.window_handles
puts handles

driver.find_elements(:tag_name, 'button').each do |button|
  puts button.text.strip.upcase
  if button.text.strip.upcase == "DAR CONSENTIMIENTO"
    puts "==> click button DAR CONSENTIMIENTO"
    button.click
  end
end
pause

puts "==> send_keys"
driver.find_element(xpath: '//input').send_keys "Canarias, España", :return
pause

handles = driver.window_handles
puts handles

places = driver.find_elements(xpath: '//div[starts-with(@class,"ubsf")]')
places.each_with_index do |div, index|
  puts "#{index} #{div.text}"
end

driver.quit
exit 0
