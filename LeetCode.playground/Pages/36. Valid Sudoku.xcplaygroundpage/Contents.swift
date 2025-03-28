/*:
 # 36. Valid Sudoku

 Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:\
 Each row must contain the digits `1-9` without repetition.\
 Each column must contain the digits `1-9` without repetition.\
 Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

 Note:\
 A Sudoku board (partially filled) could be valid but is not necessarily solvable.\
 Only the filled cells need to be validated according to the mentioned rules.

 * Callout(Example 1):
 ![Image](Sudoku-by-L2G-20050714.svg.png)\
 Input: board =\
 [["5","3",".",".","7",".",".",".","."]\
 ,["6",".",".","1","9","5",".",".","."]\
 ,[".","9","8",".",".",".",".","6","."]\
 ,["8",".",".",".","6",".",".",".","3"]\
 ,["4",".",".","8",".","3",".",".","1"]\
 ,["7",".",".",".","2",".",".",".","6"]\
 ,[".","6",".",".",".",".","2","8","."]\
 ,[".",".",".","4","1","9",".",".","5"]\
 ,[".",".",".",".","8",".",".","7","9"]]\
 Output: true
 * Callout(Example 2):
 Input: board =\
 [["8","3",".",".","7",".",".",".","."]\
 ,["6",".",".","1","9","5",".",".","."]\
 ,[".","9","8",".",".",".",".","6","."]\
 ,["8",".",".",".","6",".",".",".","3"]\
 ,["4",".",".","8",".","3",".",".","1"]\
 ,["7",".",".",".","2",".",".",".","6"]\
 ,[".","6",".",".",".",".","2","8","."]\
 ,[".",".",".","4","1","9",".",".","5"]\
 ,[".",".",".",".","8",".",".","7","9"]]\
 Output: false\
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

 **Constraints:**
 - board.length == 9
 - board[i].length == 9
 - board[i][j] is a digit 1-9 or '.'.
 */
class Solution {
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rowStates = Array(repeating: Set<Character>(), count: 9)
    var colStates = Array(repeating: Set<Character>(), count: 9)
    var boxStates = Array(repeating: Set<Character>(), count: 9)
    
    for i in 0..<9 {
      for j in 0..<9 {
        let num = board[i][j]
        if num == "." { continue }
        
        let boxIndex = (i / 3) * 3 + j / 3
        
        if rowStates[i].contains(num) || colStates[j].contains(num) || boxStates[boxIndex].contains(num) {
          return false
        }
        
        rowStates[i].insert(num)
        colStates[j].insert(num)
        boxStates[boxIndex].insert(num)
      }
    }
    
    return true
  }
}

let s = Solution()
let board1: [[Character]] = [
  ["5", "3", ".", ".", "7", ".", ".", ".", "."],
  ["6", ".", ".", "1", "9", "5", ".", ".", "."],
  [".", "9", "8", ".", ".", ".", ".", "6", "."],
  ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
  ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
  ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
  [".", "6", ".", ".", ".", ".", "2", "8", "."],
  [".", ".", ".", "4", "1", "9", ".", ".", "5"],
  [".", ".", ".", ".", "8", ".", ".", "7", "9"]
]
print(s.isValidSudoku(board1))

let board2: [[Character]] = [
  ["8", "3", ".", ".", "7", ".", ".", ".", "."],
  ["6", ".", ".", "1", "9", "5", ".", ".", "."],
  [".", "9", "8", ".", ".", ".", ".", "6", "."],
  ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
  ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
  ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
  [".", "6", ".", ".", ".", ".", "2", "8", "."],
  [".", ".", ".", "4", "1", "9", ".", ".", "5"],
  [".", ".", ".", ".", "8", ".", ".", "7", "9"]
]
print(s.isValidSudoku(board2))
