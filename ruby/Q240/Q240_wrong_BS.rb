require "pry"

# David Lin
# Search diagonally to range the matrix to 2*2 matrix in O(log(m/2)+log(n/2)) time.
# and then search the 2*2 matrix in O(1).

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix == []    
  return false if matrix == [[]]    
  
  # index of row and collumn 
  i_min,j_min = 0, 0 
  i_max,j_max = matrix[0].size - 1,matrix.size - 1 

  loop do
    i = i_min + (i_max - i_min) /2
    j = j_min + (j_max - j_min) /2
    if matrix[j][i] < target
      i_min = i
      j_min = j
    else # >= target
      i_max = i
      j_max = j
    end

    break if i_min + 1 >= i_max && j_min + 1 >= j_max
  end

  binding.pry

  for i in (i_min..i_max)
    for j in (j_min..j_max)
      return true if matrix[j][i] == target
    end
  end

  return false
end

# print search_matrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5)
# print search_matrix([[1,4,7,11,15,16],[2,5,8,12,19,20],[3,6,9,16,22,23],[10,13,14,17,24,25],[18,21,23,26,30,31]], 7)
# print search_matrix([[1]], 1)
# print search_matrix([[1]], 7)
print search_matrix([[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]],15)
