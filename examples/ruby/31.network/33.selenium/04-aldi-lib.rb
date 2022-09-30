
require "selenium-webdriver"

class Aldi
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
      end
    end

    @driver.quit
    puts "[ERROR] #{text} button not found!"
    exit 1
  end

  def filter(code)
    @driver.navigate.refresh
    @driver.find_element(name: 'Zip').send_keys code, :return
    puts "==> send_keys #{code} to Zip"

    handles = @driver.window_handles
    @driver.switch_to.window(handles[1])
  end

  def quit
    @driver.quit
  end
end
