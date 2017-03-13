# @param {String} n
# @return {String}
def smallest_good_base(n)
  # base 2
  n = n.to_i
  base_min = 2
  base_max = n 
  fraction,length = Math.frexp(n)

  while length > 1
    print "length", length
    base = (base_min + base_max) / 2 # base is mid
    
    print " base_min",base_min
    print " base_max",base_max
    print " base",base
    print "\n"

    left = base ** (length + 1) 
    right = n * (base - 1) + 1

    if left > right  
      base_max = base
    elsif left < right
      base_min = base + 1
    else
      return base.to_s if base ** (length + 1) == n * (base - 1) + 1
    end

    if base_max <= base_min
      base_min = 2
      base_max = n 
      length = length - 1  
    end
  end

  return (n-1).to_s

end

# print smallest_good_base("3")
# print smallest_good_base("13")
# print smallest_good_base("4681")
# print smallest_good_base("1000000000000000000")
# print smallest_good_base("26504196177401065")
# print smallest_good_base("821424692950225218")
# print smallest_good_base("210724372007205925")

