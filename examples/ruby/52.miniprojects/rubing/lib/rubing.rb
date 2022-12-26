require "tty-progressbar"
require_relative "rubing/exercise"

module Rubing
  def self.start
    filenames = Dir.glob("exercises/**/*rb")
    bar = TTY::ProgressBar.new("Progress [:bar]", total: filenames.size)
    filenames.each do |filename|
      bar.advance
      Exercise.new(filename).call
    end
  end
end
