/*:
 ### 107. Binary Tree Level Order Traversal II
 
 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its bottom-up level order traversal as:
 [
 [15,7],
 [9,20],
 [3]
 ]
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

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var result: [[Int]] = []
    var queue: [TreeNode] = []
    
    if let aRoot = root {
        queue.append(aRoot)
    }
    
    while queue.count > 0 {
        let count = queue.count
        var temp = [Int]()
        
        for _ in 0..<count {
            let currentNode = queue[0]
            queue.remove(at: 0)
            
            temp.append(currentNode.val)
            
            if let left = currentNode.left {
                queue.append(left)
            }
            if let right = currentNode.right {
                queue.append(right)
            }
        }
        
        result.insert(temp, at: 0)
    }
    
    return result   
}

/*:
 [<< 104. Maximum Depth of Binary Tree](@previous)
 
 [>> 108. Convert Sorted Array to Binary Search Tree](@next)
 */
