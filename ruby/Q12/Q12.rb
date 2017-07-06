# 2017-07-01
# David Lin
# I:1, V:5, M:10, L:50, C:100, D:500, M:1000

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  m = ["","M","MM","MMM","MMMM"]
  c = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
  x = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
  i = ["","I","II","III","IV","V","VI","VII","VIII","IX"]
  return m[num%1000] + c[num%1000/100] + x[num%100/10] + i[num%10] 
end
