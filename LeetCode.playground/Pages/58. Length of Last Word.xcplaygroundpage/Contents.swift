/*:
 # 58. Length of Last Word

 Given a string `s` consisting of words and spaces, return the length of the last word in the string.

 A word is a maximal [substring](https://leetcode.com/problems/length-of-last-word/description/?envType=study-plan-v2&envId=top-interview-150#:~:text=is%20a%20maximal-,substring,-consisting%20of%20non) consisting of non-space characters only.

 * Callout(Example 1):
 Input: s = "Hello World"\
 Output: 5\
 Explanation: The last word is "World" with length 5.
 ---
 * Callout(Example 2):
 Input: s = "   fly me   to   the moon  "\
 Output: 4\
 Explanation: The last word is "moon" with length 4.
 ---
 * Callout(Example 3):
 Input: s = "luffy is still joyboy"\
 Output: 6\
 Explanation: The last word is "joyboy" with length 6.

 **Constraints:**
 - 1 <= s.length <= 104
 - s consists of only English letters and spaces ' '.
 - There will be at least one word in s.
 */
class Solution {
  func lengthOfLastWord(_ s: String) -> Int {
    var length = 0, isCounting = false
    
    for char in s.reversed() {
      if char == " " {
        if isCounting { break }
      } else {
        length += 1
        isCounting = true
      }
    }
    
    return length
  }
}

let s = Solution()
print(s.lengthOfLastWord("Hello World"))
print(s.lengthOfLastWord("   fly me   to   the moon  "))  
print(s.lengthOfLastWord("luffy is still joyboy"))  
