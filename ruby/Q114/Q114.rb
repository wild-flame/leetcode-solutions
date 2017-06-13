# David Lin
# 2017-04-19
# Method: recursively flatten the tree

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  return if root == nil

  # left subtree
  if root.left != nil
    flatten(root.left) # make sure the left subtree is already flattened
    node = root.left # node is the last element of the already flattened tree
    while node.right != nil
      node = node.right
    end
  end

  # right subtree
  flatten(root.right) # make sure the right subtree is already flattened

  # flatten current root
  if node != nil # if node is 'nil' means current root is already flattened
    node.right = root.right
    root.right = root.left
    root.left = nil
  end

  return # do not return anything
end


