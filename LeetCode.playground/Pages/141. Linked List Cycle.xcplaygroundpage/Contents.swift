/*:
 # 141. Linked List Cycle

 Given head, the head of a linked list, determine if the linked list has a cycle in it.

 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

 Return true if there is a cycle in the linked list. Otherwise, return false.

 * Callout(Example 1):
 ![Image](circularlinkedlist.png)\
 Input: head = [3,2,0,-4], pos = 1\
 Output: true\
 Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).
 ---
 * Callout(Example 2):
 ![Image](circularlinkedlist_test2.png)\
 Input: head = [1,2], pos = 0\
 Output: true\
 Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.
 * Callout(Example 3):
 ![Image](circularlinkedlist_test3.png)\
 Input: head = [1], pos = -1\
 Output: false\
 Explanation: There is no cycle in the linked list.
 ---

 **Constraints:**
 - The number of the nodes in the list is in the range [0, 104].
 - -105 <= Node.val <= 105
 - pos is -1 or a valid index in the linked-list.

 Follow up: Can you solve it using O(1) (i.e. constant) memory?
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

class Solution {
  func hasCycle(_ head: ListNode?) -> Bool {
    var fast = head, slow = head
    
    while fast != nil && fast?.next != nil {
      fast = fast?.next?.next
      slow = slow?.next
      
      if fast === slow {
        return true
      }
    }
    
    return false
  }
}

let s = Solution()
print(s.hasCycle(nil) == false)
print(s.hasCycle(ListNode(0)) == false)
