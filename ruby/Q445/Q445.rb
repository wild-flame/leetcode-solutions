# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  str1 = l1.val.to_s
  str2 = l2.val.to_s 

  while l1 = l1.next
    str1 += l1.val.to_s
  end

  while l2 = l2.next
    str2 += l2.val.to_s
  end

  str = (str1.to_i + str2.to_i).to_s 

  l = nil
  m = nil

  str.each_char do |char|

    if l == nil
      l = ListNode.new(char.to_i)
      m = l
      print l 
      print m
    else
      m.next = ListNode.new(char.to_i)
      m = m.next
    end
  end

  return l
end



