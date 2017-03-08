# David Lin
#
# Leetcode - 224. Basic Calculator
# Complexity: O(n)
# Description: Using two stack operators[] and numbers[] to save operators and operands seperately

# @param {String} s
# @return {Integer}
def calculate(s)
  s = "(" + s + ")" # Add parentheses to the string
  infix = s.scan(/\s|[+-]|\d+|[\(\)]/)
  operators = []
  numbers = []

  for ops in infix
    case ops 
    when " " 
      next
    when "("
      operators.push("(")
    when ")"
      case operators.pop
      when "(" 
        next
      when "+"
        numbers.push(numbers.pop + numbers.pop); operators.pop # pop "("
      when "-"
        numbers.push(-numbers.pop + numbers.pop); operators.pop # pop "("
      end
    when "+", "-" 
      case operators.pop
      when "("
        operators.push("(")
      when "+"
        numbers.push(numbers.pop + numbers.pop);
      when "-"
        numbers.push(-numbers.pop + numbers.pop);
      end
      operators.push(ops)
    else
      numbers.push(ops.to_i)
    end
  end

  return numbers.pop
end
