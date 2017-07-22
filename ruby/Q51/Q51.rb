# David Lin
# 2017-07-20

# @param {Integer} n
# @return {String[][]}
def place(row,collumn,right_digonal,left_digonal,cur_result)
  n = collumn.length

  # quit the loop and output the result
  if row == n
    @result << cur_result.dup # be careful that you should use `dup` 
    return
  end

  for col in (0...n)
    j = col - row + n - 1
    k = row + col

    if collumn[col] == false && left_digonal[j] == false && right_digonal[k] == false
      cur_result[row] = col
      collumn[col] = left_digonal[j] = right_digonal[k] = true
      place(row + 1,collumn,right_digonal,left_digonal,cur_result)
      collumn[col] = left_digonal[j] = right_digonal[k] = false # clean the mark
      cur_result[row] = -1 
    end
  end

end

def solve_n_queens(n)
  @result = []

  # using three boolean arrays to mark if these positions are invalid.

  row = -1 # start from row '-1'
  collumn = [false] * n
  right_digonal = [false] * (2 * n - 1)
  left_digonal =  [false] * (2 * n - 1)
  cur_result = []

  place(row+1,collumn,right_digonal,left_digonal,cur_result)

  @result.map { |solution| solution.map { |pos| ("." * (n-1)).insert(pos,"Q") } }

end

if __FILE__ == $0
  solve_n_queens(4)
end


