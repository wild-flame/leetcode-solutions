# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return [] if head == nil
  dummy = ListNode.new(nil)
  dummy.next = head
  slow, fast = dummy, dummy

  while n > 0
    fast = fast.next
    n -= 1
  end

  while fast.next
    slow = slow.next
    fast = fast.next
  end

  slow.next = slow.next.next

  return dummy.next
end
