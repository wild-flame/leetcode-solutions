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
def insertion_sort_list(head)
  return [] if head == [] || head == nil
  cur = head
  dummy = ListNode.new(nil) 
  dummy.next = ListNode.new(cur.val) #fisrt node

  # while original list still has elements
  while cur = cur.next
    insert_p = dummy
    insert_node = ListNode.new(cur.val)
    loop do
      if insert_p.next == nil 
        insert_p.next = insert_node
        break
      end
      if cur.val <= insert_p.next.val
        insert_node.next = insert_p.next
        insert_p.next = insert_node
        break
      end
      insert_p = insert_p.next
    end

  end

  return dummy.next
end


