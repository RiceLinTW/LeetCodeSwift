/*:
 # 73. Set Matrix Zeroes

 Given an `m x n` integer `matrix` matrix, if an element is `0`, set its entire row and column to `0`'s.

 You must do it [in place](https://en.wikipedia.org/wiki/In-place_algorithm).

 * Callout(Example 1):
 ![Image](mat1.jpg)\
 Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]\
 Output: [[1,0,1],[0,0,0],[1,0,1]]
 ---
 * Callout(Example 2):
 ![Image](mat2.jpg)\
 Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]\
 Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
 ---

 **Constraints:**
 - m == matrix.length
 - n == matrix[0].length
 - 1 <= m, n <= 200
 - -2^31 <= matrix[i][j] <= 2^31 - 1

 **Follow up:**
 - A straightforward solution using `O(mn)` space is probably a bad idea.
 - A simple improvement uses `O(m + n)` space, but still not the best solution.
 - Could you devise a constant space solution?
 */
class Solution {
  func setZeroes(_ matrix: inout [[Int]]) {
    let m = matrix.count, n = matrix[0].count
    var firstRowZero = false, firstColZero = false

    for j in 0..<n {
        if matrix[0][j] == 0 { firstRowZero = true; break }
    }

    for i in 0..<m {
        if matrix[i][0] == 0 { firstColZero = true; break }
    }

    for i in 1..<m {
        for j in 1..<n {
            if matrix[i][j] == 0 {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    for i in 1..<m {
        for j in 1..<n {
            if matrix[i][0] == 0 || matrix[0][j] == 0 {
                matrix[i][j] = 0
            }
        }
    }

    if firstRowZero {
        for j in 0..<n {
            matrix[0][j] = 0
        }
    }

    if firstColZero {
        for i in 0..<m {
            matrix[i][0] = 0
        }
    }
  }
}

let s = Solution()
var matrix1: [[Int]] = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
s.setZeroes(&matrix1)
print(matrix1)

var matrix2: [[Int]] = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
s.setZeroes(&matrix2)
print(matrix2)
