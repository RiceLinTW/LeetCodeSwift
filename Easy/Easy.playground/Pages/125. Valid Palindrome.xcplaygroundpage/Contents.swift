/*:
 ### 125. Valid Palindrome
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 
 Example 1:
 Input: "A man, a plan, a canal: Panama"
 Output: true
 
 Example 2:
 
 Input: "race a car"
 Output: false
 */

import Foundation

func isPalindrome(_ s: String) -> Bool {
    let cleanedString = s.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    return cleanedString == String(cleanedString.reversed())
}

/*:
 [<< 122. Best Time to Buy and Sell Stock II](@previous)
 
 [>> 136. Single Number](@next)
 */
