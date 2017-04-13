# David Lin
# Method: traversal the tree level by level

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  return [] if root == nil 
  
  list = []
  stack = []
  next_level = []

  # the first level
  list << [root.val]
  stack << root
  stack << "#" # add "#" to mark the end of a level
  
  while stack.length > 0 
  # print stack.map { |node| node == "#" ? "#" : node.val if node != nil}
    node = stack.shift
    if node == "#"
      break if stack.length == 0 # break if no more element in the stack
      next_level = stack.map { |node| node.val }
      list << next_level
      stack << "#"
    else
      stack << node.left if node.left != nil
      stack << node.right if node.right != nil
    end
  end

  list.reverse
end




