# David Lin
# 2017-08-02
# Decription: similar to adder in Electric Engineering
# Complexity: O(n)

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  carry = 1 
  digits.reverse!.map! do |digit|
    digit = digit + carry
    carry = 0
    if digit == 10
      digit = 0
      carry = 1
    end
    digit
  end
  if carry == 1
    return [1] + digits.reverse # if the siginificant number is 9 and the array is not 0.
  else
    return digits.reverse
  end
end

if __FILE__ == $0 
  print plus_one([1,2,3,4])
  print plus_one([9])
  print plus_one([1,9])
end
