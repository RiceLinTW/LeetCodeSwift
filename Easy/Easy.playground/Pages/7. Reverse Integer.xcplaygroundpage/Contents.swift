/*:
 ### 7. Reverse Integer
 
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 */

import Foundation

func reverse(_ x: Int) -> Int {
    guard x < Int32.max else { return 0 }
    var result = 0
    var s = String(x)
    
    if x < 0 {
        s = s.replacingOccurrences(of: "-", with: "")
    }
    
    for (i, sub) in String(s).enumerated() {
        result += Int(sub.description)! * Int(pow(10, Double(i)))
    }
    
    guard result < Int32.max else { return 0 }
    
    return x < 0 ? 0 - result : result
}

/*:
 [<< 1. Two Sum](@previous)
 
 [>> 9. Palindrome Number](@next)
 */
