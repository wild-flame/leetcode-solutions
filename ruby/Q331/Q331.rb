# David Lin
# 2017-07-22
# Method: Using regexp
#
# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
  nodes = preorder.split(",")
  loop do
    return true if preorder == "#"
    return false if preorder == nil
    preorder = preorder.gsub!(/\d+,#,#/,"#")
    # preorder.gsub! will return nil if not-matched while preorder.gsub wouldn't
  end
end

if __FILE__ == $0 
  is_valid_serialization("9,3,4,#,#,1,#,#,2,#,6,1,#,#,#,#")
end
