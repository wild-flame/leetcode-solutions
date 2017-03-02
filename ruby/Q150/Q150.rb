# 150. Evaluate Reverse Polish Notation
# Author: David Lin

# @param {String[]} tokens
# @return {Integer}

def eval_rpn(tokens)
  operators = ["+","-","*","/"]
  stack = []

  for char in tokens
    if operators.include? char
      a = stack.pop.to_i
      b = stack.pop.to_i
      stack.push(b.to_f.send(char, a)) # or stack.push(eval("(b.to_f"+char+"a).to_i"))
    else
      stack.push(char)
    end
  end

  return stack[0].to_i
end

