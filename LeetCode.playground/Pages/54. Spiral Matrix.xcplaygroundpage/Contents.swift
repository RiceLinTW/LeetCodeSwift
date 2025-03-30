/*:
 # 54. Spiral Matrix

 Given an `m x n` `matrix`, return all elements of the `matrix` in spiral order.

 * Callout(Example 1):
 ![Image](spiral1.jpg)\
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]\
 Output: [1,2,3,6,9,8,7,4,5]
 ---
 * Callout(Example 2):
 ![Image](spiral2.jpg)\
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]\
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 ---

 **Constraints:**
 - m == matrix.length
 - n == matrix[i].length
 - 1 <= m, n <= 10
 - -100 <= matrix[i][j] <= 100
 */
class Solution {
  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result: [Int] = []

    var top = 0, left = 0, bottom = matrix.count - 1, right = matrix[0].count - 1

    while top <= bottom, left <= right {
      for i in left...right {
        result.append(matrix[top][i])
      }
      top += 1

      if top <= bottom {
        for i in top...bottom {
          result.append(matrix[i][right])
        }
        right -= 1
      }

      if top <= bottom {
        for i in stride(from: right, through: left, by: -1) {
          result.append(matrix[bottom][i])
        }
        bottom -= 1
      }

      if left <= right {
        for i in stride(from: bottom, through: top, by: -1) {
          result.append(matrix[i][left])
        }
        left += 1
      }
    }

    return result
  }
}

let s = Solution()
print(s.spiralOrder([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
print(s.spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]))
