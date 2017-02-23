# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return [] if head == nil
  return head if k == 0

  dummy = ListNode.new(nil)
  dummy.next = head
  fast, slow = dummy, dummy 

  length = 0

  while k > 0
    k -= 1
    fast = fast.next
    length = length + 1
    if fast.next == nil 
      k = k % length 
      fast = dummy
      length = 0
      return head if k == 0
    end
  end 

  while fast.next
    slow = slow.next
    fast = fast.next 
  end


  dummy.next = slow.next
  fast.next = head
  slow.next = nil

  return dummy.next

end
