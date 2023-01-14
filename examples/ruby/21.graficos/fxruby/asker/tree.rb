# Node in the class hierarchy tree
class ClassTreeNode
  def initialize(name, parent_name)
    @name = name
    @parent_name = parent_name
    @children = []
  end

  def addChild(child)
    @children.push(child)
  end

  def className
    @name
  end

  def parentClassName
    @parent_name
  end

  def <=>(other)
    className <=> other.className
  end

  def children
    @children.sort
  end
end

class ClassTree
  def initialize
    classes = {}
    classes["X"] = ClassTreeNode.new("X", nil)
    classes["A"] = ClassTreeNode.new("A", "X")
    classes["B"] = ClassTreeNode.new("B", "X")
    classes["C"] = ClassTreeNode.new("C", "X")

    roots = []
    classes.each_value do |value|
      parentNode = classes[value.parentClassName]
      if parentNode
        parentNode.addChild(value)
      else
        parentNode = ClassTreeNode.new(value.parentClassName, nil)
      end
    end

    @root = classes["X"]
  end

  def root
    return @root
  end
end
