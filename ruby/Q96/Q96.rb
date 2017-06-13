# @param {Integer} n
# @return {Integer}
def num_trees(n)
  result = 1
  return result if n == 1
  
  for k in (2..n)
    result *= (n + k) / k
  end

  return result
end
