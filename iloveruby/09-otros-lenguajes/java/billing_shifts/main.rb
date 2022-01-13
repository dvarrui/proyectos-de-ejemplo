#!/usr/bin/env ruby

require_relative 'lib/domain'

shift = WorkedShift.new(1, "2019-08-01 08:00:00", "2019-08-01 14:00:00")
billing = BillingRule.new(1, BillingType::FIXED, 10.0, "09:00", "11:00")

puts shift.inspect
puts billing.inspect
