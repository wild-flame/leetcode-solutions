# 2017-06-03
# David Lin
# Method: Hash Map 


# 最直接的办法是两个for循环找出所有subarray的合然后和K比较，这个办法是O(n^3)。优化一点的办法是先O(n)求出0到1,0到2……，0到n的合。这样3到6的合等于0到6的合减去0到2的合。就不需要从3加到6，因为subarray一定是连续的，简化了计算，性能是O(n^2)。再进行优化的话，在过一遍nums的时候，把每个sum，0-1,0-2……存到hashmap里面，保存sum出现的次数。假设k=3，当i=6的时候sum=7，然后发现0-2的sum是4，0-4的sum也是4，就出现两个满足的条件，3-6和5-6。hashmap存的是（4,2），res += map.get(4)。我们不关心具体是从哪个数到哪个数组成了K，只关心组成了几次K。Hash的是O(n)，spaceO(n)

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  map = Hash.new(0)
  sum, result = 0, 0
  for i in nums
    sum += i
    result += map[sum - k]
    map[sum] = map[sum] + 1
  end
  return result   
end

