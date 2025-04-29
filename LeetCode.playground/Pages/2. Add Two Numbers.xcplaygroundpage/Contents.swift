/*:
 # 2. Add Two Numbers

 You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order**, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 * Callout(Example 1):
 ![Image](addtwonumber1.jpg)\
 Input: l1 = [2,4,3], l2 = [5,6,4]\
 Output: [7,0,8]\
 Explanation: 342 + 465 = 807.
 ---
 * Callout(Example 2):
 Input: l1 = [0], l2 = [0]\
 Output: [0]
 ---
 * Callout(Example 3):
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]\
 Output: [8,9,9,9,0,0,0,1]
 ---

 **Constraints:**
 - The number of nodes in each linked list is in the range [1, 100].
 - 0 <= Node.val <= 9
 - It is guaranteed that the list represents a number that does not have leading zeros.
 */

// Definition for singly-linked list.
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil }
  public init(_ val: Int) { self.val = val; self.next = nil }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

class Solution {
  func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var current = dummy
    var p = l1, q = l2
    var carry = 0
    
    while p != nil || q != nil || carry != 0 {
      let x = p?.val ?? 0
      let y = q?.val ?? 0
      let sum = x + y + carry
      
      carry = sum / 10
      current.next = ListNode(sum % 10)
      current = current.next!
      
      p = p?.next
      q = q?.next
    }
    
    return dummy.next
  }
}

// 將 [Int] 轉成 Linked List
func buildList(_ nums: [Int]) -> ListNode? {
  let dummy = ListNode(0)
  var current = dummy
  for num in nums {
    current.next = ListNode(num)
    current = current.next!
  }
  return dummy.next
}

// 將 Linked List 印出來
func printList(_ head: ListNode?) {
  var current = head
  var result: [Int] = []
  while current != nil {
    result.append(current!.val)
    current = current?.next
  }
  print(result)
}
let s = Solution()

let ex1L1 = buildList([2, 4, 3])
let ex1L2 = buildList([5, 6, 4])
printList(s.addTwoNumbers(ex1L1, ex1L2))


let ex2L1 = buildList([1])
let ex2L2 = buildList([9, 9])
printList(s.addTwoNumbers(ex2L1, ex2L2))
