
require "selenium-webdriver"

class Aldi
  attr_reader :driver

  def initialize(url)
    @url = url
    @driver = Selenium::WebDriver.for :firefox
    @driver.get @url
    @driver.manage.timeouts.implicit_wait = 30
  end

  def pause
    puts "(Push enter to continue)"
    gets
  end

  def click_button(text)
    @driver.find_elements(:tag_name, 'button').each do |button|
      if button.text == text
        puts "    [Window] #{@driver.title}"
        puts "==> click #{button.text}"
        button.click
        return true
      else
        puts "    [Debug] Button #{button.text}" unless button.text.size.zero?
      end
    end

    @driver.quit
    puts "[ERROR] #{text} button not found!"
    exit 1
  end

  def filter(code)
    @driver.navigate.refresh
    select_element = @driver.find_element(name: "Radius")
    select = Selenium::WebDriver::Support::Select.new(select_element)
    select.select_by(:text,'5 km')

    @driver.find_element(name: 'Zip').send_keys code, :return
    puts "==> send_keys #{code} to Zip"

    handles = @driver.window_handles
    @driver.switch_to.window(handles[1])
  end

  def click_link(text)
    @driver.find_elements(:tag_name, 'a').each do |a|
      if a.text == text
        puts "    [Window] #{@driver.title}"
        puts "==> click #{a.text}"
        a.click
        return true
      end
    end

    @driver.quit
    puts "[ERROR] #{text} link not found!"
    exit 1
  end

  def quit
    @driver.quit
  end
end
