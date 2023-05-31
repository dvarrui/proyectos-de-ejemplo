#!/usr/bin/env ruby

require_relative "lib/selenium-wrapper"

URL = "https://www.aldi.es/supermercados/encuentra-tu-supermercado.html/s?q=Canarias%2C%20Espa%C3%B1a"

browser = SeleniumWrapper.new(URL)
driver = browser.driver

browser.quit
