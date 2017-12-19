class Node
  attr_accessor :value, :left, :right, :parent
    def initialize(value=nil, left=nil, right=nil, parent=nil)
      @value=value
      @left=left
      @right=right
      @parent=parent
    end
end

class Tree
  def initialize
    @nodes_array=[]
  end

  def nodes_array
    @nodes_array
  end

  def elements(array)
   @root= Node.new(array[0])
   @nodes_array<<@root
   array.shift
   array.each do |value|
      make_tree(value, @root)
    end
  end


  def make_tree(value, original)
    if value <= original.value && original.left == nil
      original.left =node=Node.new(value)
      node.parent=original
      @nodes_array<<node
    elsif value > original.value && original.right == nil
      original.right= node=Node.new(value)
      node.parent= original
      @nodes_array<<node
    elsif value <= original.value && original.left != nil
      make_tree(value, original.left)
    elsif value > original.value && original.right != nil
      make_tree(value, original.right)
    end
  end

end

tree=Tree.new
tree.elements([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])


puts "NODES"
tree.nodes_array.each do |x|
print "Node #{x}, Value #{x.value}, Right #{x.right}, Left #{x.left}"
puts ""
end
