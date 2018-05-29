# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  return [] if nums.length == 0

  result = []

  start = 0
  last = 0

  while true 
    while nums[last + 1] == nums[last] + 1 
      last = last + 1
      break if last == nums.length
    end

    if start == last
      ele = nums[last].to_s
    elsif last > start 
      ele = nums[start].to_s + "->" + nums[last].to_s
    end

    result.push(ele)
    start = last + 1
    last = start

    return result if start == nums.length
  end

end

