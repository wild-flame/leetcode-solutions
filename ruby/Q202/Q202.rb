# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  maps = {}

  loop do
    sum = 0
    n.to_s.each_char do |digit|
      sum = digit.to_i * digit.to_i + sum
    end
    return true if sum == 1
    return false if maps[sum] == true
    
    maps[sum] == true
  end

end
