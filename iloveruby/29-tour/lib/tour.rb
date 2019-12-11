
require_relative 'tour/markdown'
require_relative 'tour/debug'

class Tour
  def self.start(input)
    if input.empty?
      puts "Usage: tour PATH/TO/FILE.md"
      exit 1
    end
    data = Markdown.new.parse(input.first)
    Debug.show_data(data)
  end
end
