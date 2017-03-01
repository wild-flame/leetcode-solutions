# Author: David
# Language: Ruby
# Time Complexity: O(n), Space Complexity: O(n)

# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
  stack = [] # A stack with descrending order
  result = []
  nums = nums + nums # Double the length of nums, Because this is a circular array

  cur_index = 0
  while cur_index < nums.length

    if stack.length == 0 || nums[cur_index] <= nums[stack.last]
      stack << cur_index
      cur_index += 1
    else
      result[stack.pop] = nums[cur_index]
    end

  end

  while stack.length > 0 # the remaining numbers in stack do not have NGN (Next Greater Number). 
    result[stack.pop] = -1
  end

  return result[0...nums.length/2]
end


