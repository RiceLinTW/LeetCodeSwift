/*:
 # 125. Valid Palindrome

 A phrase is a **palindrome** if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.

 * Callout(Example 1):
 Input: s = "A man, a plan, a canal: Panama"\
 Output: true\
 Explanation: "amanaplanacanalpanama" is a palindrome.
 ---
 * Callout(Example 2):
 Input: s = "race a car"\
 Output: false\
 Explanation: "raceacar" is not a palindrome.
 ---
 * Callout(Example 3):
 Input: s = " "\
 Output: true\
 Explanation: s is an empty string "" after removing non-alphanumeric characters.\
 Since an empty string reads the same forward and backward, it is a palindrome.
 ---

 **Constraints:**
 - 1 <= s.length <= 2 * 105
 - s consists only of printable ASCII characters.
 */
class Solution {
  func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s.lowercased())
    var left = 0, right = chars.count - 1
    
    while left < right {
      while left < right && !chars[left].isLetter && !chars[left].isNumber {
        left += 1
      }
      while left < right && !chars[right].isLetter && !chars[right].isNumber {
        right -= 1
      }
      if chars[left] != chars[right] {
        return false
      }
      
      left += 1
      right -= 1
    }
    
    return true
  }
}

let s = Solution()
print(s.isPalindrome("A man, a plan, a canal: Panama") == true)
print(s.isPalindrome("race a car") == false)
print(s.isPalindrome(" ") == true)
