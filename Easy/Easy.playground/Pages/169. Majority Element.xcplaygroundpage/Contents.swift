/*:
 ### 169. Majority Element
 
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 Example 1:
 Input: [3,2,3]
 Output: 3
 
 Example 2:
 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    let set = NSCountedSet(array: nums)
    var result = 0
    set.forEach { (int) in
        if set.count(for: int) > nums.count / 2 {
            result = (int as! NSNumber).intValue
        }
    }
    
    return result
}

/*:
 [<< 168. Excel Sheet Column Title](@previous)
 
 [>> 171. Excel Sheet Column Number](@next)
 */
