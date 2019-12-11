
require_relative 'tour/markdown'
require_relative 'tour/debug'

class Tour
  def self.start(input)
    puts "[INFO] Starting tour..."
    data = Markdown.new(input.first).parse
    Debug.show_data(data)
  end
end
