# https://leetcode.com/problems/open-the-lock/description/
# Author: David Lin
# 2018-11-28
#
# Sotution 2: Graph
#
# @param {String[]} deadends
# @param {String} target
# @return {Integer}

def open_lock(deadends, target)
  return -1 if deadends.include?("0000") # Special Condition

  dp = [0]
  queue = []
  root = "0000"
  queue << root  

  while(queue.length > 0) 
    cur_node = queue.shift()
    upNodes = nextNodes(cur_node, :up, dp, deadends, target)
    return upNodes if upNodes.is_a?(Numeric)
    downNodes = nextNodes(cur_node, :down, dp, deadends, target)
    return downNodes if donwNodes.is_a?(Numeric)
    nextNodes = upNodes + downNodes

    # ["1301","0113","0202","0122","3012","0131","0200","0203","1232","0222"]
    # "2311"
    
    queue.concat(nextNodes)
  end

  return -1 if dp[target.to_i] == nil

end

def nextNodes(num, direction, dp, deadends, target) 
  digits = num.split("").map {|a| a.to_i}
  nextNodes = []
  if direction == :up
    for i in (0..3) 
      new_digits = digits.dup
      new_digits[i] = (new_digits[i] + 1) % 10
      nextNode = new_digits.join("")
      if dp[nextNode.to_i] == nil && !deadends.include?(nextNode)
        dp[nextNode.to_i] = dp[num.to_i] + 1 
        return dp[nextNodes.to_i] if nextNodes == target
        nextNodes.push(nextNode)
      end 
    end
  elsif direction == :down
    for i in (0..3) 
      new_digits = digits.dup
      new_digits[i] = (new_digits[i] - 1) % 10
      nextNode = new_digits.join("")
      if dp[nextNode.to_i] == nil && !deadends.include?(nextNode)
        dp[nextNode.to_i] = dp[num.to_i] + 1
        return dp[nextNodes.to_i] if nextNodes == target
        nextNodes.push(nextNode)
      end
    end
  end
  return nextNodes
end   


if __FILE__ == $0
  deadends = ["1301","0113","0202","0122","3012","0131","0200","0203","1232","0222"]
  target = "2311"
  puts "result", open_lock(deadends,target)
end

## Solution 

