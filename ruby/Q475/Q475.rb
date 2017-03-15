# David Lin
# Leetcode - Q475. Heaters
# Complexity: Time:O(n*k), Space:O(1)
# --------------------------

# @param {Integer[]} houses
# @param {Integer[]} heaters
# @return {Integer}
def find_radius(houses, heaters)
  output_min = 0 
  output_max = 10 ** 9
  houses_copy = houses.clone
  
  for i in (0..34)

    if check_if_valid?(heaters, houses, output)
      output_max = output
    else
      output_min = output
    end

    if output_min + 1 >= output_max
      houses = houses_copy.clone
      check_if_valid(heaters, houses
    end

    houses = houses_copy.clone
  end

  return output
end

def check_if_valid?(heaters, houses, output)
  heaters.each do |heater|
    houses.delete_if do |house|
      return true if houses.length == 0
      (house - heater).abs <= output
    end
  end
  return true if houses.length == 0
  return false
end

print find_radius([1,2,3,4], [1,2,3,4])
print find_radius([1,2,3], [2])
print find_radius([1,5],[10])
