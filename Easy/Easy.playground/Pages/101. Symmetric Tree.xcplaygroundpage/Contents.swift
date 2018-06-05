/*:
 ### 101. Symmetric Tree
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
      1
     / \
    2   2
   / \ / \
  3  4 4  3
 But the following [1,2,2,null,3,null,3] is not:
    1
   / \
  2   2
   \   \
    3   3
 Note:
 Bonus points if you could solve it both recursively and iteratively.
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

func isSymmetric(_ root: TreeNode?) -> Bool {
    return isReversedTree(root?.left, root?.right)
}

func isReversedTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard let ap = p, let aq = q else {
        return p == nil && q == nil
    }
    guard ap.val == aq.val else {
        return false
    }
    return isReversedTree(ap.left, aq.right) && isReversedTree(ap.right, aq.left)
}

/*:
 [<< 100. Same Tree](@previous)
 
 [>> 104. Maximum Depth of Binary Tree](@next)
 */
