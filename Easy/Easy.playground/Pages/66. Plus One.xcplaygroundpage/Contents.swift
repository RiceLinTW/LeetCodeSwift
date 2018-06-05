/*:
 ### 66. Plus One
 
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Example 1:
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 Example 2:
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    guard digits != [9] else { return [1, 0] }
    
    var result: [Int] = digits.reversed()
    
    if result[0] == 9 {
        result[0] = 0
        for i in 1..<result.count {
            let num = result[i]
            if num != 9 {
                result[i] = num + 1
                break
            } else {
                if i == result.count - 1 {
                    result[i] = 0
                    result += [1]
                } else {
                    result[i] = 0
                }
            }
        }
    } else {
        result[0] = result[0] + 1
    }
    
    return result.reversed()
}

/*:
 [<< 58. Length of Last Word](@previous)
 
 [>> 67. Add Binary](@next)
 */
