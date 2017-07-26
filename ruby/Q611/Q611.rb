# 2017-07-25
# David Lin
# Method: Brute force, TLE

# @param {Integer[]} nums
# @return {Integer}
def triangle_number(nums)
  nums.sort!
  count = 0
  for i in (0...nums.length)
    for j in ((i+1)...nums.length)
      for k in ((j+1)...nums.length)
        if nums[i] + nums[j] > nums[k]
          count += 1
        else
          break
        end
      end
    end
  end  
  return count
end

# Method 2: Linear Scan
# Decription: when i is fixed, you can scan the array only once to determine j,k at the same time. Each time there will be (k - j - 1) valid triangle.
#
# @param {Integer[]} nums
# @return {Integer}

def triangle_number(nums)
  nums.sort!
  count = 0
  for i in (0...nums.length)
    k = i + 2
    next if nums[i] == 0 # if nums[i] == 0, then there is no need to detemine the other two side.
    for j in ((i+1)...nums.length)
      while k < nums.length && nums[i] + nums[j] > nums[k] # check k first otherwise nums[k] == nil
        k += 1 
      end
      count += k - j - 1 
    end
  end
  return count
end


