# 2017-06-29
# David Lin
# Method: loop
# Time Complexity: O(logn)

# https://leetcode.com/problems/power-of-three/#/description

# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  loop do
    return true if n == 1
    n,mod = n.divmod 3
    return false if mod != 0 or n <= 0
  end
end
