class TreeNode
  def initialize(name, parent_name)
    @name = name
    @parent_name = parent_name
    @children = []
  end

  def add_child(child)
    @children.push(child)
  end

  def name
    @name
  end

  def parent_name
    @parent_name
  end

  def <=>(other)
    name <=> other.name
  end

  def children
    @children.sort
  end
end

class ClassTree
  def initialize
    classes = {}
    classes["X"] = TreeNode.new("X", nil)
    classes["A"] = TreeNode.new("A", "X")
    classes["B"] = TreeNode.new("B", "X")
    classes["C"] = TreeNode.new("C", "X")

    roots = []
    classes.each_value do |value|
      parent = classes[value.parent_name]
      if parent
        parent.add_child(value)
      else
        parent = TreeNode.new(value.parent_name, nil)
      end
    end

    @root = classes["X"]
  end

  def root
    @root
  end
end
