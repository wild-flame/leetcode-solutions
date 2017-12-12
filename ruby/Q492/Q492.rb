# Leetcode 492
# David Lin

# @param {Integer} area
# @return {Integer[]}
def construct_rectangle(area)
    for w in Math.sqrt(area).floor.downto(1)
        l,r = area.divmod(w)
        return [l,w] if l*w == area
    end
end

