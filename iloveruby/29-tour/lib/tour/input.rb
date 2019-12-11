
require_relative 'debug'
require_relative 'markdown'

module Input
  def self.read(input)
    if input.empty?
      puts "Usage: tour PATH/TO/FILE.md"
      exit 1
    end
    data = Markdown.new.parse(input.first)
    Debug.show_data(data)
    return data
  end
end
