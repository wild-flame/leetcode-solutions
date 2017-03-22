# David Lin
# Leetcode 174 - Dungeon Game
# Top-down DP
# Time Comlexity: O(mn), but O(M!N!) without cache.
# 318ms

# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  # t,l,b,r refer to top,left,bottom,right
  t,l,b,r = 0,0,dungeon.size - 1, dungeon[0].size - 1
  cache = {} #remember to add cache or it will be TLE!!!!
  return calculate_minimum_hp_with_range(dungeon,t,l,b,r,cache)
end

def calculate_minimum_hp_with_range(dungeon,t,l,b,r,cache)
  return cache[[t,l]] if cache[[t,l]] != nil
    
  if t != b and l == r
    min_hp = calculate_minimum_hp_with_range(dungeon, t + 1, l, b, r,cache) - dungeon[t][l]
  elsif t == b and l != r
    min_hp = calculate_minimum_hp_with_range(dungeon, t, l + 1, b, r,cache) - dungeon[t][l]
  elsif t != b and l != r
    min_hp = [calculate_minimum_hp_with_range(dungeon, t, l + 1, b, r,cache) - dungeon[t][l], calculate_minimum_hp_with_range(dungeon, t + 1, l, b, r, cache) - dungeon[t][l]].min
  else # t == b and l == r
    min_hp = 1 - dungeon[t][l] 
  end

  cache[[t,l]] = [min_hp,1].max 
  return [min_hp,1].max
end

