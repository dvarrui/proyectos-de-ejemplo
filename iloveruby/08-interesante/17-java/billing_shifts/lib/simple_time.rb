
class SimpleTime
  attr_reader :hour, :minutes

  def initialize(time='00:00')
    times = time.split(':')
    @hour = times[0].to_i
    @minutes = times[1].to_i
    raise "Invalid time" if !(0..23).include?(@hour) || !(0..59).include?(@minutes)
  end
end
