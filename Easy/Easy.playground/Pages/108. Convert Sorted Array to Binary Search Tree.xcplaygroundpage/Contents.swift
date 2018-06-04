//: [Previous](@previous)

import Foundation

// Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
//
// For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
//
// Example:
//
// Given the sorted array: [-10,-3,0,5,9],
//
// One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
//
//      0
//     / \
//   -3   9
//   /   /
// -10  5
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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    guard nums.count > 0 else {
        return nil
    }
    
    return findMiddleNode(nums: nums)
}

func findMiddleNode(nums: [Int]) -> TreeNode? {
    let middleIndex = nums.count / 2
    let middle = nums[middleIndex]
    
    switch nums.count {
    case 1:
        return TreeNode(nums[0])
    case 2:
        let node = TreeNode(nums[1])
        node.left = TreeNode(nums[0])
        return node
    default:
        let node = TreeNode(middle)
        node.left = findMiddleNode(nums: nums[0..<middleIndex].sorted())
        node.right = findMiddleNode(nums: nums[middleIndex + 1..<nums.count].sorted())
        return node
    }
}
