#!/usr/bin/env ruby

require_relative "07-alcampo-lib"
require 'debug'

URL = "https://www.alcampo.es/empresa/tiendas"

browser = Alcampo.new(URL)
puts "[Title] #{browser.driver.title}"

driver = browser.driver
titles = driver.find_elements(:class, "title").map { _1.text }
quiets = driver.find_elements(:class, "quite").map { _1.text }
streets = driver.find_elements(:class, "adreessWoosMap").map { _1.text }
hours = driver.find_elements(:class, "schedule").map { _1.text }

links = driver.find_elements(:tag_name, "a").map do |a|
  href = a.attribute("href")
  if href.start_with? "/empresa/tienda/"
    output = [href, a.text]
    puts output.to_s
  else
    ""
  end
end

browser.quit

puts titles.size
puts quiets.size
puts links.size
puts streets.size
puts hours.size

puts titles[0]
puts quites[0]
puts streets[0]
puts hours[0]
