# 2017-04-08
# David Lin
# Method: Use the idea of bucket sort

# @param {Integer[]} nums
# @return {Integer}

# TLE

INT_MAX = 2**31 - 1
INT_MIN = -2**31

def maximum_gap(nums)
  bucket = {} 
  gap = 0

  # return gap if nums.length < 2 # gap = 0

  for num in nums
    bucket[num] = true
  end

  for i in (INT_MIN..INT_MAX)
    if bucket[i] != nil
      cur = bucket
      if prev != nil
        gap = [cur - prev, gap].max
        prev = cur
      end
    end
  end

  return gap
end

print maximum_gap([])
