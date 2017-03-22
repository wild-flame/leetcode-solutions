# David Lin
# Get all the combination and print the result

# @param {Integer} num
# @return {String[]}
def read_binary_watch(num)
  result = []

  (0..9).to_a.combination(num).each do |arr|
    full_binary = Array.new(10,0)
    arr.each do |index|
      full_binary[index] = 1
    end
    h = full_binary[0..3].join.to_i(2)
    m = full_binary[4..9].join.to_i(2)
    result << sprintf("%d:%02d",h,m) if h < 12 &&  m < 60
  end

  result 
end

# print read_binary_watch(1)
