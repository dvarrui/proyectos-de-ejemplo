
def print(*args)
  if args.is_a? Array
    puts args.join(" ")
  else
    puts(args)
  end
end

def type(x)
  key = x.class.to_s.to_sym
  types = { String: "str", Integer: "int", Float: "float"}
  "<type '#{types[key]}'>"
end

def str(obj) = obj.to_s
def int(obj) = obj.to_i
def float(obj) = obj.to_f
