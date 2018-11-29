require "pry"
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
  dp = {"0000" => 0}

  for deadend in deadends
    dp[deadend] = 1.0 / 0
  end

  q = Queue.new()
  q << "0000"

  while (q.length > 0) 

    cur = q.shift()

    break if cur == target
    
    for next_move in moves(cur)
      if !dp.key? next_move
        dp[next_move] = dp[cur] + 1
        q << next_move
      end
    end
  end

  return -1 if dp[target] == nil or dp[target].infinite? == 1
  return dp[target]

end

def moves(cur)
  res = []
  for i in (0..3)
    for j in [1,-1]
      res << (cur[0...i] + ((cur[i].to_i + j) % 10).to_s + cur[(i+1)..3])
    end
  end
  return res
end

if __FILE__ == $0
  deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"]
  target = "8888"
  puts "result", open_lock(deadends,target)
end


