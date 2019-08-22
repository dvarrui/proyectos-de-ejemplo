#!/usr/bin/env ruby

require_relative 'lib/domain'

puts "[INFO] SimpleTime"
t1 = SimpleTime.new("18:04")
p t1

puts "[INFO] Duration"
d2 = Duration.new("2019-08-01 08:00:00", "2019-08-01 14:00:00")
p d2

puts "[INFO] WorkedShift"
ws3 = WorkedShift.new(1, "2019-08-01 08:00:00", "2019-08-01 14:00:00")
p ws3

puts "[INFO] BillingRule"
br4 = BillingRule.new(1, BillingType::FIXED, 10.0, "09:00", "11:00")
p br4
#shift = WorkedShift.new(1, "2019-08-01 08:00:00", "2019-08-01 14:00:00")
#billing = BillingRule.new(1, BillingType::FIXED, 10.0, "09:00", "11:00")

#puts shift.inspect
#puts billing.inspect
