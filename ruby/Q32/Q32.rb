# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  count = 0
  max_length = 0
  left,right = 0,0

  for i in (0...s.length)
    if s[i] == "("
      left += 1
      puts left
    end

    if s[i] == ")"
      right += 1
    end

    if (left == right)
      count = count + left 
      left, right = 0, 0      
    end

    if right > left
      left, right = 0, 0
      count = 0
    end

    max_length = [count * 2 , max_length].max
  end

  count = 0
  left,right = 0,0

  for i in (1..s.length)
    if s[-i] == "("
      left += 1
    end

    if s[-i] == ")"
      right += 1
    end

    if (left == right)
      count = count + left
      left, right = 0, 0
    end

    if left > right
      left, right = 0, 0
      count = 0
    end

    max_length = [count * 2 , max_length].max
  end

  return max_length
end

