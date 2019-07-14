
class CSV
  attr_reader :head, :data

  def initialize(filename)
    lines = `cat #{filename+'.csv'}`.split("\n")
    @head = lines[0].split(',')
    lines.delete_at(0)
    @data = []
    lines.each do |line|
      row = line.split(',')
      @data << row
    end
  end

  def select(name)
    output = []
    index = @head.index(name)
    @data.each { |line| output << line[index] }
    output
  end

end

def csv(file)
  c = CSV.new(file)
  return c
end
