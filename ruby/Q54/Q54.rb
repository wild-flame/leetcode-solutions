# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix == []

  top,left,right,bottom = 0,0, matrix[0].length - 1,matrix.length - 1
  i,j = top,left
  flag = false
  result = []

  while top <= bottom && left <= right 

    # from left to right
    break if left > right
    for j in (left..right) 
      result << matrix[top][j]
    end
    top = top + 1

    # from top to bottom
    break if top > bottom
    for i in (top..bottom) 
      result << matrix[i][right]
    end
    right = right - 1

    # from right to left
    break if right < left
    right.downto(left) do |j|
      result << matrix[bottom][j]
    end
    bottom = bottom - 1

    # from bottom to top 
    break if bottom < top
    bottom.downto(top) do |i|
      result << matrix[i][left]
    end
    left = left + 1
  end

  return result
end

