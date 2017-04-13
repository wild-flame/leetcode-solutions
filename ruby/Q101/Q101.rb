# 2017-04-12
# David Lin
# Method: traversal the tree symmetrically.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root == nil
  return _helper_(root.left, root.right)
end

def _helper_(left, right)
  if left != nil && right != nil && left.val == right.val
    return _helper_(left.left, right.right) && _helper_(left.right, right.left)
  elsif left == nil && right == nil
    return true
  else
    return false
  end
end

