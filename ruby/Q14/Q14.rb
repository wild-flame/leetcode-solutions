# Author: David Lin
# Date: 2017-02-21

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs) 
  return "" if strs == []

  result = strs[0]

  idx = 0
  last_index = -1
  loop do 
    for str in strs
      last_index = idx if result[idx] != str[idx] || idx == str.length 
    end
    break if last_index != -1
    idx += 1
  end

  result[0...idx]
end

