
module Debug
  def self.show_data(data)
    puts "[DEBUG] Showing data content..."
    puts "  Title : #{data[:title]}"
    data[:slides].each do |slide|
      puts "  - Slide : #{slide[:title]}"
    end
  end
end
