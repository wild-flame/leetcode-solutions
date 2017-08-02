# David Lin
# 2017-07-31
# Method: Hashmap
# Time Complexity: O(n)

# @param {Integer[][]} wall
# @return {Integer}
def least_bricks(wall)
  edges = {} 
  for row in wall
    position = 0
    for brick in row
      position += brick
      if edges[position] != nil 
        edges[position] += 1
      else
        edges[position] = 1
      end
    end
    edges.delete(position)
  end 

  cur_val = 0
  res = 0
  for pos, val in edges
    if val > cur_val
      cur_val = val
      res = val 
      print res
    else
      next
    end
  end

  return wall.length - res
end

