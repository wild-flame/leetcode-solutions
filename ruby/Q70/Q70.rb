# 2017-04-24
# David Lin
# Leetcode 70 - Climbing stairs
# Method: DP

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2
  memo = {1 => 1, 2 => 2}
  dp(n-1, memo) + dp(n-2, memo) 
end

def dp(n, memo)
  if memo[n] == nil
    memo[n] = dp(n-1, memo) + dp(n-2, memo) 
  end
  return memo[n]
end

if __FILE__==$0
  print climb_stairs(10)
end
