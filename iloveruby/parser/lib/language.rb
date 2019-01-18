
class Language
  def initialize
    @keywords = [ 'else', 'end', 'if', 'print', 'puts']
    @operators = [ '+', '-', '*', '/']
    @assignments = [ "\=" ]
    @methods = [ '=', '<<']
    @digits = '0123456789'
    @letters = 'abcdefghijklmnopqrstuvwxyz'
  end

  def keyword?(value)
    return true if @keywords.include? value
    false
  end

  def operator?(value)
    return true if @operators.include? value
    false
  end

  def assignment?(value)
    return true if @assignments.include? value
    false
  end

  def integer?(value)
    i = value.to_i
    return true if value == i.to_s
    false
  end

  def identifier?(value)
    c = value[0]
    return true if @letters.include? c
    false
  end

  def type_of(value)
    return :keyword if keyword? value
    return :operator if operator? value
    return :assignment if assignment? value
    return :identifier if identifier? value
    return :integer if integer? value
    return :UNKNOWN
  end
end
