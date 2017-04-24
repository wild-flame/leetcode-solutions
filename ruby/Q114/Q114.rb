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

 if root.left != nil
   flatten(root.left) # make sure the left subtree is already flattened
   node = root.left
 else
   return
 end

 while node.right != nil
    node = node.right
 end
 
 flatten(root.right) # make sure the left subtree is already flattened
 
 node.right = root.right
 root.right = root.left
 root.left = nil

end


