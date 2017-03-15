# David Lin
# Complexity: Time:O(logn), Space:O(1)
# Decriptions: Count the number of 2,5 in factorial (In fact, you only need to count the number of 5)

# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  # the initial state
  step, sum = 5,0

  while n/step > 0
    sum += (n/step) 
    n = n/step
  end 

  return sum
end
