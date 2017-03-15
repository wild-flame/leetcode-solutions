# David Lin
# Complexity: Time/Space O(n)
# Description: 
# Leetcode - 313. Super Ugly Number
# Dynamic Programming, pls refer to problem 264, using the same approach.	

# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
  uglys = [0,1]
  p = Array.new(primes.length,1) 

  loop do 
    possible_next_ugly = []
    primes.each_with_index do |prime,index|
      possible_next_ugly << (prime * uglys[p[index]])
    end
    next_ugly = possible_next_ugly.min
    p.each_with_index do |pt,index|
      p[index] += 1 if next_ugly == primes[index] * uglys[pt]
    end
    uglys << next_ugly if uglys.last != next_ugly
    return uglys[n] if uglys[n] != nil
  end
end

