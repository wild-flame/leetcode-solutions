# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def odd_even_list(head)
  dummy_l1 = ListNode.new(nil)
  dummy_l2 = ListNode.new(nil) 
  
  cur = head
  l1 = dummy_l1
  l2 = dummy_l2
  count = 1

  while cur != nil

    if count%2 == 1
      l1.next = cur
      l1 = l1.next
    elsif count%2 == 0 
      l2.next = cur
      l2 = l2.next
    end

    # remeber to unlink the current list otherwise there would be a circle
    tmp = cur.next
    cur.next = nil
    cur = tmp

    count = count + 1
  end

  l1.next = dummy_l2.next
  return dummy_l1.next
end



