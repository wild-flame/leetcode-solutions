# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
#
# Method 1:Bruteforce TLE!

class Array
  def sum
    self.reduce(0, :+)
  end
end

def four_sum(nums, target)
  nums.combination(4).select { |num| num.sum == target }   #`Enumerator.find_all` is the same as `.select` 
end

# # Method 2: DP
#
#
class SortedArray < Array
  def find_2_sum(target)
    result = []
    b = 0
    c = self.length - 1
    while b < c 
      case self[b] + self[c] <=> target # camparison symbol
      when -1 
        b += 1 
      when 0
        result << [self[b],self[c]]  
        b += 1
      when 1
        c -= 1
      end
    end
    return result
  end

  def find_4_sum(target)
    result = []
    d = self.length - 1
    while d > 2
      a = 0
      while a < d - 2 
        break if self[a] * 4 > target or self[d] * 4 < target
        target_2 = target - self[a] - self[d]
        self[(a+1)..(d-1)].find_2_sum(target_2).each { |result_2| result << [self[a],result_2,self[d]].flatten }
        a += 1
      end
      d -= 1
    end
    return result
  end
end  

def four_sum(nums, target)
  nums = SortedArray.new(nums.sort) 
  result = nums.find_4_sum(target).uniq
end


if __FILE__ == $0 # same as python `if __name__ == '__main__':`
  nums = [1, 0, -1, 0, -2, 2]
  target = 0
  # nums = [-3,-2,-1,0,0,1,2,3] # test remove duplicate
  # target =0
  print four_sum(nums, target)
end

# A very good review for this question
#
# https://www.sigmainfy.com/blog/4sum-problem-analysis-different-time-complexity.html
