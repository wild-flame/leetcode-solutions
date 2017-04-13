# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  return [] if n == 0
  s = ["0","1"]
  for i in (1...n)
    s1 = s.map { |e| "0" + e }
    s2 = s.map { |e| "1" + e }
    s = s1 + s2.reverse
  end
  s 
end
