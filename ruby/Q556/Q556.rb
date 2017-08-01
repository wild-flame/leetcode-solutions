# David Lin
# 2017-07-26

# @param {Integer} n
# @return {Integer}
class Integer
  def digits
    Enumerator.new do |x|
      to_s.chars.map {|c| x << c.to_i }
    end
  end
end

def next_greater_element(n)
  digits = n.digits.to_a
 
  i = digits.length - 2 

  # find the right-most digit which is less than its right digit
  while i >= 0 && digits[i] >= digits[i+1] # pay atttention to "="
    i = i - 1
  end
  
  return -1 if i == -1 
    
  j = digits.length - 1
  
  # find the next greater digits on the right side of digits[i]
  while digits[j] <= digits[i] # pay attension to "=" 
    j = j - 1 
  end

  digits[i],digits[j] = digits[j],digits[i] # swap them
  digits[(i+1)...digits.length] = digits[(i+1)...digits.length].sort

  result = digits.join("").to_i
  return result if result < 2147483647 # 32-bit integer
  return -1
end



