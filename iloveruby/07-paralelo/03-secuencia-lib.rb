
class SequentialProcess
  attr_reader :id, :input_delay, :real_delay
   @@id = 0

  def initialize(input_delay)
    @id = @@id
    @@id += 1
    @input_delay = input_delay
    @real_delay = 0
  end

  def process
    begintime=Time.now
    puts "[#{@id}] BEGIN |   input delay : #{@input_delay}"
    sleep(@input_delay)
    endtime = Time.now
    @real_delay = endtime-begintime
    puts "[#{@id}] END   |    real delay : #{ @real_delay.to_i}"
  end
end

def show_begin_title(values)
  puts "="*40
  puts "   Script : #{$0} "
  puts "   Inputs : #{values.to_s}"
  puts "="*40
end

def show_end_title(items)
  duration = 0.0
  items.each { |item| duration += item.real_delay }
  puts "="*40
  puts "           Total duration = #{duration.to_i}"
  puts "="*40
end
