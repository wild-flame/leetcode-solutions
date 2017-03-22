# David Lin

# Solution 1
# Method: get all possible partition and check if it is a palindrome
# TLE!

# @param {String} s
# @return {String[][]}
def partition(s)
  pos = (0...(s.length - 1)).to_a
  result = []

  result << [s] if s.palindrome? 

  for number_of_partition in (1...s.length)
    cur_pivots = pos.combination(number_of_partition).to_a

    cur_pivots.each do |pivots|
      cur_result = []
      pivots.each_index do |index|
        if index == 0
          str = s[0..pivots[index]]
        else
          str = s[(pivots[index - 1]+1)..pivots[index]]
        end
        cur_result << str
        cur_result << s[(pivots[index]+1)..-1] if index == pivots.length - 1
      end
      result << cur_result if cur_result.palindrome_all?
    end
  end

  return result
end

class String
  # add palindrome method to string class
  def palindrome?
  l,r = 0, self.length -1 
    while l < r && s[l] == s[r]
      l += 1; r -= 1
    end
    return false if s[l] != s[r] 
    true
  end
end

class Array
  # check if all string in the array is palindrome
  def palindrome_all?
    for str in self
      return false if str.palindrome? == false
    end 
    return true
  end
end

# Solution 2
# Method: recursively partition the string

def partition(s)
  result = []
  _partition_(s, 0, [], result)
  result 
end

class String
  # add palindrome method to string class
  def palindrome?
  l,r = 0, self.length -1 
    while l < r && s[l] == s[r]
      l += 1; r -= 1
    end
    return false if s[l] != s[r] 
    true
  end
end

private def _partition_(s, left, tracing, result)
  if left == s.size
    result << tracing; return
  end 

  left.upto(s.size - 1) do |right|
    l,r = left, right
    next if s[l..r].palindrome? == false
    _partition_(s, right + 1, tracing.dup << s[left..right], result)
  end
end



print partition("amanaplanacanalpanama")
