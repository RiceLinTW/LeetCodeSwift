/*:
 ### 104. Maximum Depth of Binary Tree
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 Given binary tree [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
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

func maxDepth(_ root: TreeNode?) -> Int {
    guard let aRoot = root else {
        return 0
    }
    let count = 1
    return max(currentCount(count: count, node: root?.left), currentCount(count: count, node: root?.right))
}

func currentCount(count: Int, node: TreeNode?) -> Int {
    guard let aNode = node else {
        return count
    }
    let aCount = count + 1
    return max(currentCount(count: aCount, node: node?.left), currentCount(count: aCount, node: node?.right))
}

/*:
 [<< 101. Symmetric Tree](@previous)
 
 [>> 107. Binary Tree Level Order Traversal II](@next)
 */
