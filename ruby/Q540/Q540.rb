# David Lin
# 2017-12-14

# @param {Integer[]} nums
# @return {Integer}
def single_non_duplicate(nums)
    index = 0
    while true
       if nums[index] == nums[index+1] 
           index = index + 2
       else
           return nums[index]
       end
    end
end
