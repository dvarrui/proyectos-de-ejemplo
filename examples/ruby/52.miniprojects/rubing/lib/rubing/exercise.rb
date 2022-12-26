class Exercise
  attr_reader :filename
  
  def initialize(filename)
    @filename = filename
  end

  def call
    puts "=" * 40
    puts "Exercise: #{filename}"
    syntax_ok = system("ruby -c #{filename}")
    puts "\nOutput:"
    exec_ok = system("ruby #{filename}")
    puts "=" * 40
  end
end
