# 2017-04-11
# David Lin
# Method: Dynamic Programming

# @param {Integer[][]} matrix
# @return {Integer[][]}
def update_matrix(matrix)
  width, height = matrix[0].length, matrix.length
  matrix = matrix.map { |row| row.map { |element| element == 0 ? 0 : 20000 }} # 20000 means infinity distance

  # scan from left to right
  j = 0
  while j < height 
    i = 0 
    while i < width - 1
      i += 1
      matrix[j][i] = [matrix[j][i - 1] + 1, matrix[j][i]].min if matrix[j][i] != 0
    end
    j += 1
  end

  # scan from top to bottom
  i = 0
  while i < width
    j = 0 
    while j < height - 1
      j += 1
      matrix[j][i] = [matrix[j -1][i] + 1, matrix[j][i]].min if matrix[j][i] != 0
    end
    i += 1
  end

  # scan from right to left 
  j = 0
  while j < height 
    i = width - 1 
    while i > 0 
      i -= 1
      matrix[j][i] = [matrix[j][i+1] + 1, matrix[j][i]].min if matrix[j][i] != 0
    end
    j += 1
  end

  # scan from bottom to top
  i = 0
  while i < width
    j = height - 1
    while j > 0
      j -= 1
      matrix[j][i] = [matrix[j+1][i] + 1, matrix[j][i]].min if matrix[j][i] != 0
    end
    i += 1
  end

  matrix
end

# update_matrix([[0,1,1,0,0],[0,1,1,0,0],[0,1,0,0,1],[1,1,1,1,0],[1,0,0,1,0]])
