# David Lin
#
# Leetcode - 373. Find K Pairs with Smallest Sums
# https://leetcode.com/problems/find-k-pairs-with-smallest-sums
#
# Complexity: Time: O(k), Space: O(1)
# Language: Ruby

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
#
def k_smallest_pairs(nums1, nums2, k)
  count = 0
  tables = []
  result = []

  for i in (0...nums1.length) 
    for j in (0...nums2.length)
      tables << [[nums1[i],nums2[j]],nums1[i]+nums2[j]]
    end
  end

  print tables

  tables.sort {|a,b| a[1] - b[1]} 

  idx = 0
  while idx < k && idx < nums1.length * nums2.length 
    result << tables[idx][0]
    idx = idx + 1
  end

  return result 
end




