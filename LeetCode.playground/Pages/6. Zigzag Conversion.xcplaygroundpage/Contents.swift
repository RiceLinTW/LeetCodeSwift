/*:
 # 6. Zigzag Conversion

 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"

 Write the code that will take a string and make this conversion given a number of rows:

 string convert(string s, int numRows);

 * Callout(Example 1):
 Input: s = "PAYPALISHIRING", numRows = 3\
 Output: "PAHNAPLSIIGYIR"
 ---
 * Callout(Example 2):
 Input: s = "PAYPALISHIRING", numRows = 4\
 Output: "PINALSIGYAHRPI"\
 Explanation:\
 P     I    N\
 A   L S  I G\
 Y A   H R\
 P     I
 ---
 * Callout(Example 3):
 Input: s = "A", numRows = 1\
 Output: "A"

 **Constraints:**
 - 1 <= s.length <= 1000
 - s consists of English letters (lower-case and upper-case), ',' and '.'.
 - 1 <= numRows <= 1000
 */
class Solution {
  func convert(_ s: String, _ numRows: Int) -> String {
    guard numRows != 1, s.count > numRows else {
      return s
    }
    
    var rows = Array(repeating: "", count: numRows)
    var index = 0
    var direction = -1
    
    for char in s {
      rows[index].append(char)
      
      if index == 0 || index == numRows - 1 {
        direction *= -1
      }
      
      index += direction
    }
    
    return rows.joined()
  }
}

let s = Solution()
print(s.convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
