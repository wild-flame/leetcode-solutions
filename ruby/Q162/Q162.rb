# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  left = 0
  right = nums.length - 1

#  return 0 if nums.length == 1

  loop do
    mid = (left + right)/2
    
    if left == right
      return mid
    elsif right == left + 1
      return left if nums[left] > nums[right]
      return right
    end

    # if mid == 0 and nums[0] > nums[1]
    # return 0
    # elsif mid == nums.length - 1 and nums[-1] > nums[-2] 
    # return nums.length - 1
    if nums[mid] < nums[mid-1]
      right = mid
    elsif nums[mid] < nums[mid+1]
      left = mid
    else
      return mid
    end
  end

end

# puts find_peak_element([2,1])
# puts find_peak_element([1,2])
# puts find_peak_element([1,2,3,1])
# puts find_peak_element([1])


