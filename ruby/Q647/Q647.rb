# David Lin
# 2017-08-01
# Method: DP
# Time Complexity: O(n^2)

# @param {String} s
# @return {Integer}
def count_substrings(s)
  result = 0
 
  # odd
  for pos in (0...s.length)
    result += 1 
    lp,rp = pos - 1, pos + 1
    while lp >= 0 && rp < s.length && s[lp] == s[rp]
      result += 1
      lp,rp = lp - 1, rp + 1
    end
  end

  # even  
  for pos in (0...(s.length - 1))
    lp,rp = pos, pos + 1
    while lp >= 0 && rp < s.length && s[lp] == s[rp]
      result += 1
      lp,rp = lp - 1, rp + 1
    end
  end

  return result
end
