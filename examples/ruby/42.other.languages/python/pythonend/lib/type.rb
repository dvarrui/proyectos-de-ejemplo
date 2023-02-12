
def type(x)
  key = x.class.to_s.to_sym
  types = {
    FalseClass: "bool",
    Float: "float",
    Hash: "dict",
    Integer: "int",
    NilClass: "NoneType",
    Range: "range",
    String: "str",
    TrueClass: "bool"
  }
  "<type '#{types[key]}'>"
end

def float(obj) = obj.to_f
def int(obj) = obj.to_i
def str(obj) = obj.to_s
