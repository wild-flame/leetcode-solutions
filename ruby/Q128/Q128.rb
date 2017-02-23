# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  return 0 if nums == []
  map = {} 
  min,max = nums.min, nums.max

  for num in nums
    map[num] = 1
  end

  count = 1 
  max_count = 0

  for index, key in map
    cur_index = index

    while map[cur_index - 1] == 1
      cur_index = cur_index - 1
      count = count + 1
      map.delete(cur_index)
    end

    cur_index = index
    while map[cur_index + 1] == 1
      cur_index = cur_index + 1
      count = count + 1
      map.delete(cur_index)
    end

    max_count = count if count > max_count
    count = 1
  end
  
  print map 

  return max_count
end


puts longest_consecutive([])
puts longest_consecutive([100,4,200,1,3,2])
puts longest_consecutive([-1,1,0])
puts longest_consecutive([1,2,0,1])


