# David Lin

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    l = 0
    while true
        num = nums.shift()
        r = nums.find_index { |n| n == target - num }
        return [l,r+l+1] if r 
        l = l + 1
    end
end

# wrong anwser [3,3],6
