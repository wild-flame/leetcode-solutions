# David Lin
# Search diagonally through the matrix in O(m+n) time, where m,n is the size of the matrix.

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  # special cases
  return false if matrix == []    
  return false if matrix == [[]]   

  # index of row,collumn
  i,j = 0, matrix.size-1

  loop do
    case matrix[j][i] <=> target
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
    break if (j == -1 || i == matrix[0].size)
  end

  return false
end  

print search_matrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5) 
print search_matrix([[1,4,7,11,15,16],[2,5,8,12,19,20],[3,6,9,16,22,23],[10,13,14,17,24,25],[18,21,23,26,30,31]], 7)
print search_matrix([[1]], 1)
print search_matrix([[1]], 7)
print search_matrix([[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]],15) 
print search_matrix([[1,1]],0)
