
class Rule
  attr_reader :combination
  def initialize(*combination)
    @combination = combination
    @are_included = 0
    @are_in_position = 0
  end
end
