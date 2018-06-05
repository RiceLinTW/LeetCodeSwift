/*:
 ### 112. Path Sum
 
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given the below binary tree and sum = 22,
 
        5
       / \
      4   8
     /   / \
    11  13  4
   /  \      \
  7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
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

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard let aRoot = root else {
        return false
    }
    
    if sum == aRoot.val, aRoot.left == nil, aRoot.right == nil {
        return true
    }
    
    return (hasPathSum(aRoot.left, sum - aRoot.val) || hasPathSum(aRoot.right, sum - aRoot.val))
}

/*:
 [<< 111. Minimum Depth of Binary Tree](@previous)
 
 [>> 118. Pascal's Triangle](@next)
 */
