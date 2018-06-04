//: [Previous](@previous)

import Foundation

// Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
//
// See image at https://leetcode.com/problems/pascals-triangle/description/
//
// In Pascal's triangle, each number is the sum of the two numbers directly above it.
//
// Example:
// Input: 5
// Output:
// [
//  [1],
//  [1,1],
//  [1,2,1],
//  [1,3,3,1],
//   [1,4,6,4,1]
// ]
func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else {
        return []
    }
    
    var result: [[Int]] = []
    
    for i in 1...numRows {
        var array = [Int](repeating: 1, count: i)
        for j in 0..<i {
            switch j {
            case 0, i - 1:
                break
            default:
                let previous = result.last!
                array[j] = previous[j - 1] + previous[j]
                break
            }
        }
        result.append(array)
    }
    
    return result
}
