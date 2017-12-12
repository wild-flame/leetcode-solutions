# David Lin
# 2017-12-12

# Limits on Integer Constants
INT_BIT = 32
INT_MAX =  2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)

# @param {Integer} x
# @return {Integer}
def reverse(x)
    s = x.to_s.reverse.to_i
    s = s > INT_MAX ? 0 : s
    return x >= 0 ? s : -s
end
