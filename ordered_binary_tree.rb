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
#  attr_accessor :root

  def initialize
    @nodes_array=[]
    #@root=nil
    #@node_total=0
    #@nodes=[]
  end

  #def make_nodes(ary)
  #  ary.each do |x|
  #    @nodes<<Node.new(x)
  #  end
  #  if @root == nil
  #     @root = @nodes[0]
  #  end
#  end

#  def nodes
  #  @nodes
#  end

def nodes_array
  @nodes_array
end

    def make_tree(array, original=nil)
      if array.length==1
        return
      end
      if original == nil
        original = Node.new(array[0])
        @nodes_array<<original
      end



      node=Node.new(array[1])
      @nodes_array<<node
    if node.value < original.value && original.left ==nil
      original.left =node
      node.parent=original
      array.shift
      make_tree(array, original)
    elsif node.value >original.value && original.right ==nil
      original.right= node
      node.parent= original
      array.shift
      make_tree(array, original)
    elsif node.value< original.value  && original.left !=nil
      @nodes_array.pop
      make_tree(array, original.left)
    elsif node.value > original.value && original.right !=nil
      @nodes_array.pop
      make_tree(array, original.right)
    end
  end


  end

  tree=Tree.new

  tree.make_tree([1, 2, 3, 4, 5])
   tree.nodes_array


  puts "NODES"
tree.nodes_array.each do |x|
    puts ""
    puts "node"
  puts x
  puts "value"
  puts x.value
  puts "parent"
  puts x.parent
  puts "right"
  puts x.right
  puts "left"
  puts x.left
end
