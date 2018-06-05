/*:
 ### 14. Longest Common Prefix
 
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 Example 1:
 
 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:
 
 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:
 
 All given inputs are in lowercase letters a-z.
 */
import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0, var result = strs.first, result.count > 0 else { return ""}
    
    for str in strs {
        
        if str.count < result.count {
            result = String(result[result.startIndex..<str.endIndex])
        }
        
        for i in 0..<result.count {
            if result[result.index(result.startIndex, offsetBy: i)] != str[str.index(str.startIndex, offsetBy: i)] {
                result = String(result[result.startIndex..<result.index(result.startIndex, offsetBy: i)])
                break
            }
        }
    }
    
    return result
}

/*:
 [<< 13. Roman to Integer](@previous)
 
 [>> 20. Valid Parentheses](@next)
 */
