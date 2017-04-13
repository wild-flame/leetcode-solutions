# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
   [].tap{ |result| (0..nums.length).to_a.each { |i| nums.combination(i).reduce(result,:<<) } }
end
