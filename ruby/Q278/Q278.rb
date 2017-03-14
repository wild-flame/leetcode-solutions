# David Lin
# Complexity: Suppose is_bad_version() is O(1) complexity, 
#             then the total complexity is O(logn)
# Description: Binary Search. 

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  left = 0
  right = n

  while left + 1< right
    mid = left + (right - left) / 2
    if is_bad_version(mid)  
      right = mid
    else
      left = mid
    end
  end

  return left if is_bad_version(left) # check the edge case
  return right
end
