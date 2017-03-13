# @param {String} n
# @return {String}
def smallest_good_base(n)
  # base 2
  n = n.to_i
  base_min = 2
  base_max = n 
  fraction,length = Math.frexp(n)

  while length > 1
    subsum = 1 
    sum = 0
    base = (n ** (1.0/length)).to_i # base is mid
    
#    print "length", length, "\n"
#    print "base", base, "\n"

    for i in (0..length+1) # while sum < n
      sum += subsum 
      subsum *= base 
      return base.to_s if sum == n && base > 1
    end

    length = length - 1  
  end

  return (n-1).to_s
end

print smallest_good_base("3")
print smallest_good_base("13")
print smallest_good_base("4681")
print smallest_good_base("1000000000000000000")
print smallest_good_base("26504196177401065")
print smallest_good_base("821424692950225218")
print smallest_good_base("210724372007205925")

