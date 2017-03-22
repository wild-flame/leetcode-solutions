·# David Lin
# Complexity: O(logn)
# Method: Binary Search

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  l,r = 0, nums.length - 1
  while l + 1 < r
    m = l + (r -l) / 2
    nums[m] < nums[r] ? r = m : l = m
  end
  return nums[l] < nums[r] ? nums[l] : nums[r]
end


