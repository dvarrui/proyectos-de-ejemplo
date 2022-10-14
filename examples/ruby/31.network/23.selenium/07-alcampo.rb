#!/usr/bin/env ruby

require_relative "07-selenium-lib"
require 'debug'

URL = "https://www.alcampo.es/empresa/tiendas"

browser = SeleniumWrapper.new(URL)
puts "[Title] #{browser.driver.title}"

driver = browser.driver
links = driver.find_elements(:tag_name, "a").map do |a| 
  # href = a.attribute("href")
  # unless /empresa\/tienda\//.match(href).nil?
  system("echo '#{href}' >> alcampo.log")
  href
  #else
  #  nil
  #end
end
links.compact!
puts links
puts links.size

browser.quit

