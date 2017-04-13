# 2017-04-13
# David Lin
# Leetcode 513
# Method: BFS 

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def find_bottom_left_value(root)
  stack = []  
  left_most_node = root
  stack << root
  stack << "#"
  
  node = stack.shift
  loop do
    if node == "#"
      if stack.length > 0
        left_most_node = stack.shift
        stack << "#"
        node = left_most_node
      else
        break
      end
    else
      stack << node.left if node.left != nil
      stack << node.right if node.right != nil
      node = stack.shift
    end
  end

  return left_most_node.val
end
