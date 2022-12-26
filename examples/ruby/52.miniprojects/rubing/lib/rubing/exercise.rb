class Exercise
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @content = File.read(@filename)
    find_done
    find_todo
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

    unless @todo.size.zero?
      lines = @content.split("\n")
      @todo.each do |index|
        puts "%02d | %s" % [index + 1, lines[index]]
      end
    else syntax_ok and exec_ok
      puts "\n=> Delete 'I AM NOT DONE' to continue!"
    end
  end

  private

  def find_done
    filter = /# I AM NOT DONE/
    @done = false
    @done = true if @content.match(filter).nil?
  end

  def find_todo
    @todo = []
    lines = @content.split("\n")
    lines.each_with_index do |line, index|
      @todo << index if line.include? "# TODO:"
    end
  end
end
