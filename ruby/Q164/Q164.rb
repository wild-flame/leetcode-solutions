# 2017-04-08
# David Lin
# Method: Use the idea of sort

# @param {Integer[]} nums
# @return {Integer}

# TLE

INT_MAX = 2**31 - 1
INT_MIN = -2**31

def maximum_gap(nums)
  nums.sort!
  return 0 if nums.length < 2
  gap = 0
  for i in (0...(nums.length - 1))
    gap = [nums[i+1] - nums[i],gap].max
  end
  gap
end
