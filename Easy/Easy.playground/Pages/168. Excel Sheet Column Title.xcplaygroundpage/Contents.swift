//: [Previous](@previous)

import Foundation

// Given a positive integer, return its corresponding column title as appear in an Excel sheet.
//
// For example:
//
// 1 -> A
// 2 -> B
// 3 -> C
// ...
// 26 -> Z
// 27 -> AA
// 28 -> AB
// ...
//
// Example 1:
// Input: 1
// Output: "A"
//
// Example 2:
// Input: 28
// Output: "AB"
//
// Example 3:
// Input: 701
// Output: "ZY"
func convertToTitle(_ n: Int) -> String {
    guard n > 26 else {
        return String(bytes: [UInt8(64 + n), 0], encoding: .utf8)!
    }
    let first = n / 26
    let second = n % 26
    guard second != 0 else {
        return convertToTitle(first - 1) + "Z"
    }
    return convertToTitle(first) + convertToTitle(second)
}
