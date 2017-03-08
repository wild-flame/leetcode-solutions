# David Lin
# 402. Remove K Digits
# Complexity: Time: O(n) Space: O(n)
# Description: Using a stack to save the digits and do the compare while building the stack

# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
  stack = []

  num.each_char do |digit|
    while stack.length != 0 && digit.to_i < stack.last && k > 0 
      stack.pop
      k = k-1
    end
    stack.push(digit.to_i)
  end
 
  while k > 0 && stack.length > 0
    stack.pop
    k = k -1 
  end
  
  result = stack.join.to_i.to_s
  return result
end


