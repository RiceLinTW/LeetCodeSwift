//: [Previous](@previous)

import Foundation

// Given two binary trees, write a function to check if they are the same or not.
//
// Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
//
// Example 1:
//
// Input:
//    1          1
//   / \        / \
//  2   3      2   3
//
// [1,2,3],   [1,2,3]
//
// Output: true
//
// Example 2:
// Input:
//    1          1
//   /            \
//  2              2
//
// [1,2],     [1,null,2]
//
// Output: false
//
// Example 3:
// Input:
//    1          1
//   / \        / \
//  2   1      1   2
//
// [1,2,1],   [1,1,2]
//
// Output: false
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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard let ap = p, let aq = q else {
        return p == nil && q == nil
    }
    guard ap.val == aq.val else {
        return false
    }
    return isSameTree(ap.left, aq.left) && isSameTree(ap.right, aq.right)
}
