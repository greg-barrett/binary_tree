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

  def bfs(n, root)
    queue=[]<<root
    until queue.length==0
      root=queue[0]
      queue<<root.left if root.left != nil
      queue<<root.right  if root.right != nil
      queue.shift if root.value !=n
      return puts "bingo #{root}" if root.value ==n
    end
    puts "nil"
  end

end

tree=Tree.new
tree.elements([13, 5, 34, 3, 8, 21, 55, 1, 0, 2, 144, 89, 233])


puts "NODES"
tree.nodes_array.each do |x|
print "Node #{x}, Value #{x.value}, Right #{x.right}, Left #{x.left}, Parent #{x.parent}"
puts ""
end
root=tree.nodes_array[0]


tree.bfs(89, root)
