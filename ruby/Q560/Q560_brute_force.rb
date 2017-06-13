# 2017-06-03
# Bruteforce: TLE

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  sums = []
  sums[0] = nums[0]
  result = 0
  result = 1 if nums[0] == k

  for i in (1...nums.length) # (0..3) is 0,1,2,3 while (0...3) is (0,1,2)
    sums[i] = sums[i-1] + nums[i]
    result += 1 if sums[i] == k
  end 

  for i in (1...nums.length)
    for j in (0...i)
      result += 1 if k == sums[i] - sums[j] 
    end
  end

  return result
end
