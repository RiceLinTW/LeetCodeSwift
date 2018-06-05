/*:
 ### 110. Balanced Binary Tree
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as:
 
 a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 Example 1:
 Given the following tree [3,9,20,null,null,15,7]:
 
      3
     / \
    9  20
      /  \
     15   7
 Return true.
 
 Example 2:
 Given the following tree [1,2,2,3,3,null,null,4,4]:
 
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 Return false.
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let aRoot = root else {
        return true
    }
    let leftDepth = depth(node: aRoot.left, currentDepth: 1)
    let rightDepth = depth(node: aRoot.right, currentDepth: 1)
    return leftDepth >= 0 && rightDepth >= 0 && abs(leftDepth - rightDepth) < 2
}

func depth(node: TreeNode?, currentDepth: Int) -> Int {
    guard let aNode = node else {
        return currentDepth - 1
    }
    let leftDepth = depth(node: aNode.left, currentDepth: currentDepth + 1)
    let rightDepth = depth(node: aNode.right, currentDepth: currentDepth + 1)
    
    guard abs(leftDepth - rightDepth) < 2 else {
        return -1
    }
    return max(depth(node: aNode.left, currentDepth: currentDepth + 1), depth(node: aNode.right, currentDepth: currentDepth + 1))
}

/*:
 [<< 108. Convert Sorted Array to Binary Search Tree](@previous)
 
 [>> 111. Minimum Depth of Binary Tree](@next)
 */
