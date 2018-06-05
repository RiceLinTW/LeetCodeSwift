/*:
 ### 171. Excel Sheet Column Number
 
 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 For example:
 
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 
 Example 1:
 Input: "A"
 Output: 1
 
 Example 2:
 Input: "AB"
 Output: 28
 
 Example 3:
 Input: "ZY"
 Output: 701
 */

import Foundation

func titleToNumber(_ s: String) -> Int {
    guard s.count > 1 else {
        return Int(s.utf8CString.first! - 64)
    }
    
    var result = 0
    for (i, char) in s.reversed().enumerated() {
        result += (Int(String(char).utf8CString.first!) - 64) * Int(pow(Double(26), Double(i)))
    }
    return result
}

/*:
 [<< 169. Majority Element](@previous)
 
 [>> 172. Factorial Trailing Zeroes](@next)
 */
