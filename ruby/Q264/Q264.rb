# David Lin
# O(n) complexity
# Using dynamic programming, bottom-up method

# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  return "n must be no more than 1690" if n > 1690
  cached,p1,p2,p3 = [1],0,0,0

  loop do
    next_ugly_number = [cached[p1]*2,cached[p2]*3,cached[p3]*5].min
    case next_ugly_number
    when cached[p1]*2 then p1 = p1 + 1
    when cached[p2]*3 then p2 = p2 + 1
    when cached[p3]*5 then p3 = p3 + 1
    end
    cached << next_ugly_number if cached.last != next_ugly_number
    return cached[n-1] if !cached[n-1].nil?
  end
end


