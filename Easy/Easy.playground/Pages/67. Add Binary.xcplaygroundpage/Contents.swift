//: [Previous](@previous)

import Foundation

// Given two binary strings, return their sum (also a binary string).
//
// The input strings are both non-empty and contains only characters 1 or 0.
//
// Example 1:
// Input: a = "11", b = "1"
// Output: "100"
//
// Example 2:
// Input: a = "1010", b = "1011"
// Output: "10101"
func addBinary(_ a: String, _ b: String) -> String {
    var result: [Character] = a.count >= b.count ? a.reversed() : b.reversed()
    let chars: [Character] = a.count < b.count ? a.reversed() : b.reversed()
    
    for (i, char) in chars.enumerated() {
        guard char == "1" else { continue }
        
        if result[i] == "1" {
            for j in i..<result.count {
                if result[j] == "0" {
                    if j == result.count - 1 {
                        result.removeLast()
                        result += ["0", "1"]
                    } else {
                        result[j] = "1"
                    }
                    break
                } else {
                    if j == result.count - 1 {
                        result.removeLast()
                        result += ["0", "1"]
                    } else {
                        result[j] = "0"
                    }
                }
            }
        } else {
            result[i] = "1"
        }
    }
    
    return String(result.reversed())
}
