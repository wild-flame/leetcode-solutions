# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  return [] if nums == []
  result = [] #用来存结果

  for i in (1..15) # 循环次数 i,这个随意，基本上十多次过 testcase 就差不多了 
    random_index = (rand() * nums.length).floor # 随机取一个数的 index
    cur_num = nums[random_index] # 存下这个数
    count = nums.count(cur_num) # 计算这个数的个数，最多 O(n)
    
    # 如果这个数出现的次数多过n/3下取整，则记下这个数。
    result << cur_num if count > (nums.length/3).floor and result.count(cur_num) == 0 
  end
  
  return result
end

