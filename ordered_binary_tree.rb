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
  attr_accessor :root
  def initialize
    @root=nil
    @node_total=0
    @nodes=[]
  end

  def make_nodes(ary)
    ary.each do |x|
      @nodes<<Node.new(x)
    end
    if @root == nil
       @root = @nodes[0]
    end
  end

  def nodes
    @nodes
  end

    def make_tree
      i=1
      current=@root

      @nodes.length-1.times do

        node=@nodes[i]
        i+=1
      while node.parent==nil
        if node.value < current.value
          if current.left == nil
            current.left = node
            node.parent= current

            break if node.parent != nil
          else
            current=current.left
          end
        else
          if current.right ==nil
            current.right = node
            node.parent = current

            break if node.parent !=nil
          else
            current=current.right
          end
        end
      end
    end
  end

  end

  tree=Tree.new
  tree.make_nodes([3, 2, 4, 5, 1])
  tree.make_tree

  puts "NODES"
  tree.nodes.each do |x|
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
