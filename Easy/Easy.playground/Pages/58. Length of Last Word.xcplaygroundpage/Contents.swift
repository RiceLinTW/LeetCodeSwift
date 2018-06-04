//: [Previous](@previous)

import Foundation

// Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
//
// If the last word does not exist, return 0.
//
// Note: A word is defined as a character sequence consists of non-space characters only.
//
// Example:
// Input: "Hello World"
// Output: 5
func lengthOfLastWord(_ s: String) -> Int {
    guard s != "" else { return 0 }
    
    var result: [String] = []
    
    var components = s.components(separatedBy: " ")
    for comp in s.components(separatedBy: " ") {
        if comp != "" {
            result.append(comp)
        }
    }
    
    return result.count > 0 ? result.last!.count : 0
}
