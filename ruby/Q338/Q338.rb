# 2017-04-26
# David Lin
# Method: DP
# Time Comlexity: O(n)

# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  res = [0]

  while res.length <= num
    res = res + res.map { |count| count + 1 }
  end

  return res[0..num]
end

