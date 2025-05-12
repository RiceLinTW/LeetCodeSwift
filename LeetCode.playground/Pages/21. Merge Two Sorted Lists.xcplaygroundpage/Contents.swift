/*:
 # 21. Merge Two Sorted Lists

 You are given the heads of two sorted linked lists `list1` and `list2`.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

 * Callout(Example 1):
 ![image](merge_ex1.jpg)\
 Input: list1 = [1,2,4], list2 = [1,3,4]\
 Output: [1,1,2,3,4,4]
 ---
 * Callout(Example 2):
 Input: list1 = [], list2 = []\
 Output: []
 ---
 * Callout(Example 3):
 Input: list1 = [], list2 = [0]\
 Output: [0]

 **Constraints**:
 - The number of nodes in both lists is in the range [0, 50].
 - -100 <= Node.val <= 100
 - Both list1 and list2 are sorted in non-decreasing order.
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
  func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var dummy: ListNode = .init(0)
    var current: ListNode? = dummy
    var l1 = list1, l2 = list2
    
    while let node1 = l1, let node2 = l2 {
      if node1.val < node2.val {
        current?.next = node1
        l1 = node1.next
      } else {
        current?.next = node2
        l2 = node2.next
      }
      
      current = current?.next
    }
    
    current?.next = l1 ?? l2
    return dummy.next
  }
}

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

let l1 = buildList([1,2,4])
let l2 = buildList([1,3,4])
let merged = s.mergeTwoLists(l1, l2)
printList(merged) // [1,1,2,3,4,4]
