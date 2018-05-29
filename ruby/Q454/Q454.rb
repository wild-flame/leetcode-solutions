# @param {Integer[]} a
# @param {Integer[]} b
# @param {Integer[]} c
# @param {Integer[]} d
# @return {Integer}
def four_sum_count(a, b, c, d)
  maps = Hash.new(0)
  count = 0

  a.each do |a| 
    b.each do |b|
      sums = a + b 
      maps[sums] = maps[sums] + 1
    end
  end

  c.each do |c|
    d.each do |d|
      sums = c + d 
      count = count + maps[-sums] 
    end
  end

  return count
end
