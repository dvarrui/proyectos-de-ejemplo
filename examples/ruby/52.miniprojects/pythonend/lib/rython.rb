
def print(*args)
  puts args
end

def type(x)
  key = x.class.to_s.to_sym
  types = { String: "str", Integer: "int"}
  "<type '#{types[key]}'>"
end
