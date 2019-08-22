require 'date'

class Duration
  attr_reader :startDate, :endDate

  def initialize(startDate, endDate)
    @startDate = DateTime.parse(startDate)
    @endDate = DateTime.parse(endDate)
  end

  def seconds
    (@endDate - @startDate).numerator
  end
end

class WorkedShift < Duration
  SECONDS_PER_DAY = 24 * 60 * 60      # 24h x 60m x 60s
  attr_reader :id

  def initialize(id, startDate, endDate)
    super(startDate, endDate)
    @id = id
    raise "The shift can't end before it starts" if @startDate > @endDate
    raise "The shift maximum duration is 24 hours" if seconds > SECONDS_PER_DAY
  end
end
