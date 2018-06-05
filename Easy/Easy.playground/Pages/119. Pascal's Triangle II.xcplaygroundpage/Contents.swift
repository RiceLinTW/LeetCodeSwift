/*:
 ### 119. Pascal's Triangle II
 
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
 
 Note that the row index starts from 0.
 
 ![Img](PascalTriangleAnimated2.gif)
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Example:
 
 Input: 3
 Output: [1,3,3,1]
 Follow up:
 
 Could you optimize your algorithm to use only O(k) extra space?
 
 */

import Foundation

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

func getRow(_ rowIndex: Int) -> [Int] {
    return generate(rowIndex + 1)[rowIndex]
}

/*:
 [<< 118. Pascal's Triangle](@previous)
 
 [>> 121. Best Time to Buy and Sell Stock](@next)
 */
