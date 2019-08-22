
module BillingType
  FIXED = "FIXED"
  DURATION = "DURATION"
end

class BillingRule
  attr_reader :id, :type, :payRate, :startTime, :endTime

  def initialize(id, type, payRate, startTime, endTime)
    @id = id
    @type = type
    @payRate = payRate
    @startTime = 'Time.new(startTime)'
    @endTime = 'Time.new(endTime)'
  end
end
