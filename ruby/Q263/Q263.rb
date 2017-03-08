# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return false if num <= 0
  while num > 1
    if num % 2 == 0
      num = num / 2
    elsif num % 3 == 0
      num = num / 3
    elsif num % 5 == 0
      num = num / 5
    else 
      return false
    end
  end  

  return num == 1
end

