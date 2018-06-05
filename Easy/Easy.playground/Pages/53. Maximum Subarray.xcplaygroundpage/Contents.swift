/*:
 ### 53. Maximum Subarray
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 Follow up:
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    
    var currentMax = nums.first!
    var currentSubtotal = nums.first!
    
    for i in 1..<nums.count {
        let int = nums[i]
        currentMax = max(currentMax + int, int)
        currentSubtotal = max(currentSubtotal, currentMax)
    }
    
    return currentSubtotal
}

/*:
 [<< 38. Count and Say](@previous)
 
 [>> 58. Length of Last Word](@next)
 */
