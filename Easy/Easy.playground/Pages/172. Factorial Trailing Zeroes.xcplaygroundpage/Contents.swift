/*:
 ### 172. Factorial Trailing Zeroes
 
 Given an integer n, return the number of trailing zeroes in n!.
 
 Example 1:
 Input: 3
 Output: 0
 Explanation: 3! = 6, no trailing zero.
 
 Example 2:
 Input: 5
 Output: 1
 Explanation: 5! = 120, one trailing zero.
 
 Note: Your solution should be in logarithmic time complexity.
 */

import Foundation

func trailingZeroes(_ n: Int) -> Int {
    var target = n
    var count = 0
    while target >= 5 {
        count += target / 5
        target /= 5
    }
    return count
}

/*:
 [<< 171. Excel Sheet Column Number](@previous)
 
 [>> 189. Rotate Array](@next)
 */
