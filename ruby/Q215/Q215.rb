# Leetcode - 215. Kth Largest Element in an Array
# Author: David Lin
# Time Complexity: O(n), Space Complexity: O(1)
# Kth Selection

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
#

class Array
  # swap index of a & b of caller array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def find_kth_largest(nums, k)
  return nil if nums = [] || k <= 0

  left = 0 
  right = nums.length - 1
  k = right - k + 1 # because I partially sort nums[] as ascending order

  loop do 

    pivot = nums[right]
    stored_index = left

    for i in (left...right)
      if nums[i] < pivot
        nums.swap!(stored_index, i)
        stored_index = stored_index + 1
      end
    end

    nums.swap!(right, stored_index)

    if stored_index == k
      return nums[stored_index]
    elsif stored_index < k 
      left = stored_index + 1
    else # stored_index > k 
      right = stored_index - 1
    end

  end
end

# This can be viewed as __MAIN__ 
#
if __FILE__ == $0
  puts find_kth_largest([1],1) # return 1
  puts find_kth_largest([3,2,1,5,6,4],2) # return 5
end
