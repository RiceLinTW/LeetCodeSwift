/*:
 ### 83. Remove Duplicates from Sorted List
 
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 Input: 1->1->2
 Output: 1->2
 
 Example 2:
 Input: 1->1->2->3->3
 Output: 1->2->3
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }
    
    var result = head
    
    while result?.next != nil {
        if result?.val == result?.next?.val {
            result?.next = result?.next?.next
        } else {
            result = result?.next
        }
    }
    
    return head
}

/*:
 [<< 70. Climbing Stairs](@previous)
 
 [>> 88. Merge Sorted Array](@next)
 */
