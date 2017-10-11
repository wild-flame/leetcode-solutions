# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} t
# @return {String}
def tree2str(t)
  return "" if t == nil

  root = t.val 
  left = tree2str(t.left)
  right = tree2str(t.right)


  if t.left == nil && t.right == nil
    return t.val.to_s
  elsif t.left != nil && t.right == nil 
    return t.val.to_s + "(" + left + ")" 
  elsif t.left == nil && t.left != nil
    return t.val.to_s + "()" + "(" + right + ")"
  else
    return t.val.to_s + "(" + left + ")(" + right +")"
  end  
end


