# 2017-06-16
# David Lin

# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} ops
# @return {Integer}

def max_count(m, n, ops)
  for op in ops
    m = [m,op[0]].min
    n = [n,op[1]].min
  end
  return m,n 
end
