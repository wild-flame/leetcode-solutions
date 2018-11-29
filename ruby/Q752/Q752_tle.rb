require "set"

# https://leetcode.com/problems/open-the-lock/description/
# Author: David Lin
# 2018-11-28
#
# Sotution 1: TLE 
#
# @param {String[]} deadends
# @param {String} target
# @return {Integer}

def open_lock(deadends, target)
  solutions = Set["0000"]
  prev_solutions = Set[]
  step = 0

  while(true) 
    step = step + 1
    prev_solutions = solutions
    for passcode in visiting_node
      cur_solutions= solutions + next_passcodes(passcode,deadends) + prev_passcodes(passcode,deadends)
      return step if cur_solutions.include?(target)
      solutions = cur_solutions
    end
    return -1 if solutions == prev_solutions
  end
end


def next_passcodes(passcode,deadends)
  ori_digits = passcode.split("").map { |a| a.to_i }
  new_set = []
  for i in (0..3)
    new_digits = ori_digits.dup
    new_digits[i] = (new_digits[i] + 1) % 10
    new_number = new_digits.join("")
    new_set << new_number
  end
  next_set = Set.new(new_set) - deadends
  return next_set 
end

def prev_passcodes(passcode,deadends)
  ori_digits = passcode.split("").map { |a| a.to_i }
  new_set = []
  for i in (0..3)
    new_digits = ori_digits.dup
    new_digits[i] = (new_digits[i] - 1) % 10
    new_number = new_digits.join("")
    new_set << new_number
  end
  prev_set = Set.new(new_set) - deadends
  return prev_set 
end

if __FILE__ == $0
  deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"]
  target = "8888"
  puts "result", open_lock(deadends,target)
end

