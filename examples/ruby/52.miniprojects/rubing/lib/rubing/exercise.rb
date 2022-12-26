class Exercise
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    is_done?
  end

  def done?
    @done
  end

  def call
    puts "\n" + "_" * 50
    puts "=> Exercise: #{filename}\n\n"
    syntax_ok = system("ruby -c #{filename}")
    if syntax_ok
      puts "=> Syntax: OK"
      puts "\n=> Output:"
      exec_ok = system("ruby #{filename}")
    else
      puts "=> Syntax: Revise!"
    end

    if syntax_ok and exec_ok
      puts "\n=> Delete 'I AM NOT DONE' to continue!"
    end
  end

  private

  def is_done?
    filter = /# I AM NOT DONE/
    content = File.read(@filename)
    @done = false
    @done = true if content.match(filter).nil?
  end
end
