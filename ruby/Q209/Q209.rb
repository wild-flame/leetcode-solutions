# https://leetcode.com/problems/minimum-size-subarray-sum/

# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  left, right = 0,0 
  sum = nums[0]
  result = nums.length 

  loop do 

    if sum < s  
      right += 1
      return 0 if left == 0 && right == nums.length
      return result if right == nums.length
      sum = sum + nums[right]
    else
      return 1 if left == right
      sum = sum - nums[left]
      cur_result = right - left + 1
      result = cur_result if cur_result < result
      left += 1
    end
  end

end

