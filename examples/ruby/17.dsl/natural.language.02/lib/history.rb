
class History
  attr_accessor :data

  def initialize
    @data = []
  end

  def add_record(actor, message)
    record =  Struct.new(:timestamp, :actor, :message)
    @data << record.new(Time.now, actor, message)
  end
end
