# David Lin
# Time Complexity, worst case O(n) 
# Divide and conquer method.
# Actually, binary search can be treat as special cases of divide and conquer.
# 65ms

# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  l = 0; r = nums.length - 1
  find_min_with_range(nums,l,r)
end

def find_min_with_range(nums,l,r)
  return nums[l] <= nums[r] ? nums[l] : nums[r] if r <= (l + 1) 
  
  m = l + (r-l) / 2  

  if nums[m] > nums[r]
    return find_min_with_range(nums,m,r)
  elsif nums[m] == nums[r]
    return [find_min_with_range(nums,l,m),find_min_with_range(nums,m,r)].min
  else # num[m] < nums[r]
    return find_min_with_range(nums,l,m)
  end
end
 
# print find_min([1])
# print find_min([1,2,3,4,5])
# print find_min([3,4,5,1,2])
# print find_min([3,3,3,1,3])
# print find_min([3,1,3,3,3])
 
