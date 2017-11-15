/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
    var pa = headA
    var pb = headB
    var flagA = true
    var flagB = true
    if (headA === null || headB === null)
        return null 
    
    while (pa !== pb) {
        if (pa.next === null) {
            if (flagA) {
                flagA = false   
                pa = headB
            } else {
                break
            }
        } else {
            pa = pa.next
        }

        if (pb.next === null) {
            if (flagB) {
                flagB = false   
                pb = headA
            } else {
                break
            }
        } else {
            pb = pb.next
        }

    } 

    if (pa === pb) {
        return pa
    } else {
        return null    
    }


};


