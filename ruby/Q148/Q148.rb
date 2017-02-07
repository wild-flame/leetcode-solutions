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
def sort_list(head)
  return nil if head == nil
  return head if head.next == nil

  mid = find_mid(head)

  l1,l2 = head, mid.next
  mid.next = nil # remeber to break the list into two part

  l1 = sort_list(l1)
  l2 = sort_list(l2)  

  l = merge_list(l1,l2)

  return l
end

# find the mid point of a linked list 
def find_mid(head)
  slow, fast = head, head

  loop do
    break if fast.next == nil || fast.next.next == nil
    fast = fast.next.next
    slow = slow.next
  end

  return slow
end

def merge_list(l1, l2)
  
  # Initial status
  if l1.val < l2.val
    head = l1
    l1 = l1.next
  else
    head = l2
    l2 = l2.next
  end

  l = head

  # merge
  loop do
    if l1 != nil and l2 == nil
      l.next = l1
      l1 = l1.next
    elsif l1 == nil and l2 != nil
      l.next = l2
      l2 = l2.next
    elsif l1 == nil and l2 == nil
      break
    else
      if l1.val < l2.val 
        l.next = l1
        l1 = l1.next
      else 
        l.next = l2
        l2 = l2.next
      end
    end
    l = l.next
  end

  return head
end
