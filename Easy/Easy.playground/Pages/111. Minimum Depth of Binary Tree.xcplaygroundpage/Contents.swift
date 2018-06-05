/*:
 ### 111. Minimum Depth of Binary Tree
 
 Given a binary tree, find its minimum depth.
 
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
     3
    / \
   9  20
     /  \
    15   7
 return its minimum depth = 2.
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

func minDepth(_ root: TreeNode?) -> Int {
    guard let aRoot = root else {
        return 0
    }
    
    return helper(aRoot)
}

func helper(_ node: TreeNode?) -> Int {
    guard let aNode = node else {
        return Int.max
    }
    
    if aNode.left == nil && aNode.right == nil {
        return 1
    }
    
    return min(helper(aNode.left), helper(aNode.right)) + 1
}

/*:
 [<< 110. Balanced Binary Tree](@previous)
 
 [>> 112. Path Sum](@next)
 */
