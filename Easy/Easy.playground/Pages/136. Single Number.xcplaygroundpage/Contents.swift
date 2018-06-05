/*:
 ### 136. Single Number
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 Input: [4,1,2,1,2]
 Output: 4
 */

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    let set = NSCountedSet(array: nums)
    set.forEach { (num) in
        if set.count(for: num) == 1 {
            result = (num as! NSNumber).intValue
        }
    }
    return result
}

/*:
 [<< 125. Valid Palindrome](@previous)
 
 [>> 167. Two Sum II - Input array is sorted](@next)
 */
