#!/usr/bin/env ruby

require 'tty-progressbar'

bar = TTY::ProgressBar.new("downloading [:bar]", total: 30)

# Once initialized, use advance method to indicated progress:

30.times do
  sleep(0.1)
  bar.advance  # by default increases by 1
end
