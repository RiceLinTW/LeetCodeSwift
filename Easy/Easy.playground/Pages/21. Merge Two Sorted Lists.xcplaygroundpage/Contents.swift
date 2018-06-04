//: [Previous](@previous)

import Foundation

// Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
//
// Example:
// Input: 1->2->4, 1->3->4
// Output: 1->1->2->3->4->4
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let result = ListNode(0)
    var node = result
    var l1 = l1
    var l2 = l2
    
    while l1 != nil && l2 != nil {
        if l1!.val < l2!.val {
            node.next = l1
            l1 = l1!.next
        } else {
            node.next = l2
            l2 = l2!.next
        }
        node = node.next!
    }
    
    node.next = l1 ?? l2
    
    return result.next
}

