
module Debug
  def self.show_data(data)
    puts "[DEBUG] Showing data content..."
    puts "  Title  : #{data[:title]} "
    puts "  Finish : #{data[:time]}"
    data[:slides].each do |slide|
      puts "  (#{slide[:index]}) #{slide[:title]}"
      slide[:lines].each do |line|
        puts "    - #{line}"
      end
    end
  end
end
