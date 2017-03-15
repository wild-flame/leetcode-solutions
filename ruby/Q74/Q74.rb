require "pry"

# David Lin
# Description: 2D binary search

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix == []
  return false if matrix == [[]]

  # index range of x and y.
  x_left, x_right = 0, matrix[0].size - 1
  y_left, y_right = 0, matrix.size - 1

  # mid 
  loop do # you need to do at least one loop 
    y_mid = y_left + (y_right - y_left) / 2
    if matrix[y_mid][0] > target
      y_right = y_mid 
    elsif matrix[y_mid][0] < target
      y_left = y_mid 
    else
      return true
    end
    break if y_left + 1 >= y_right
  end

  if matrix[y_right][0] <= target
    array = matrix[y_right]
  else
    array = matrix[y_left]
  end

  while x_right >= x_left
    x_mid = x_left + (x_right - x_left) / 2
    print x_mid
    if array[x_mid] == target
      return true
    elsif array[x_mid] < target
      x_left = x_mid + 1
    else
      x_right = x_mid - 1
    end
  end
  return false
end

# print search_matrix([[1]],1)
# print search_matrix([[1,3]],3)
print search_matrix([[1],[3]],3)
