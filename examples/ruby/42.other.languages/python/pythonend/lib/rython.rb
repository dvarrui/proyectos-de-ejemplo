
require_relative "booleans"

def print(*args)
  if args.is_a? Array
    puts args.join(" ")
  else
    puts(args)
  end
end

def range(value)
  Range.new(0,value - 1)
end

def type(x)
  key = x.class.to_s.to_sym
  types = {
    FalseClass: "bool",
    Float: "float",
    Hash: "dict",
    Integer: "int",
    Range: "range",
    String: "str",
    TrueClass: "bool"
  }
  "<type '#{types[key]}'>"
end

def float(obj) = obj.to_f
def int(obj) = obj.to_i
def str(obj) = obj.to_s
