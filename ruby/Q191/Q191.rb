# David Lin
# 2017-09-03

# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  result = 0
  while n > 0
    n, mod = n.divmod(2)
    result += 1 if mod == 1
  end
  return result
end

