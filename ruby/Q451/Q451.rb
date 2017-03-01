# Author: David
# Time Complexity: O(n) making the hash table, O(nlogn) sorting
# Space Complexity: O(k), k is the number of different chars in string s
# Language: Ruby

# @param {String} s
# @return {String}
def frequency_sort(s)
  table = {} 
  result = ""

  # Build a hash table
  s.each_char do |char|
    table[char] = ( table[char] ? table[char] + 1 : 1) 
  end

  # Sort the table and build the new string
  table.sort_by { |char, times| times }.reverse.each { |key, value| result += key*value } 

  return result 
end



