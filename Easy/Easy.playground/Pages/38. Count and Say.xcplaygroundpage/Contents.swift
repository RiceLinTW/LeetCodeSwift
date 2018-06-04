//: [Previous](@previous)

import Foundation

// The count-and-say sequence is the sequence of integers with the first five terms as following:
//
// 1.     1
// 2.     11
// 3.     21
// 4.     1211
// 5.     111221
// 1 is read off as "one 1" or 11.
// 11 is read off as "two 1s" or 21.
// 21 is read off as "one 2, then one 1" or 1211.
// Given an integer n, generate the nth term of the count-and-say sequence.
//
// Note: Each term of the sequence of integers will be represented as a string.
//
// Example 1:
// Input: 1
// Output: "1"
//
// Example 2:
// Input: 4
// Output: "1211"
func countAndSay(_ n: Int) -> String {
    guard n > 0 else { return "" }
    
    var result = "1"
    
    for i in 1..<n {
        
        var temp = ""
        var array: [Character] = []
        var current = result.first!
        
        for str in result {
            if str == current {
                array.append(str)
            } else {
                temp += "\(array.count)\(current)"
                current = str
                array.removeAll()
                array.append(str)
            }
        }
        
        temp += "\(array.count)\(current)"
        result = temp
    }
    
    return  result
}
