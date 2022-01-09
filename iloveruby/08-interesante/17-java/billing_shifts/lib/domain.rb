
require_relative 'simple_time'
require_relative 'duration'
require_relative 'billing'

class BilledShift
end

class Portion
  def initialize(id, startTime, endTime, session, pay)
    @id = id
    @startTime = startTime
    @endTime = endTime
    @session = session
    @pay = pay
  end
end
