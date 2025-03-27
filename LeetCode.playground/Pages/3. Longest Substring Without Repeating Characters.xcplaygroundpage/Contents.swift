/*:
 # 3. Longest Substring Without Repeating Characters

 Given a string `s`, find the length of the longest substring(*1) without duplicate characters.

 *1: A substring is a contiguous non-empty sequence of characters within a string.

 * Callout(Example 1):
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 ---
 * Callout(Example 2):
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 ---
 * Callout(Example 3):
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 ---

 **Constraints:**
 - 0 <= s.length <= 5 * 10^4
 - s consists of English letters, digits, symbols and spaces.
 */
class Solution {
  func lengthOfLongestSubstring(_ s: String) -> Int {
    var charSet = Set<Character>()
    var left = 0
    var maxLength = 0
    let sArray = Array(s)
    
    for right in 0 ..< sArray.count {
      let char = sArray[right]
      
      while charSet.contains(char) {
        charSet.remove(sArray[left])
        left += 1
      }
      
      charSet.insert(char)
      maxLength = max(maxLength, right - left + 1)
    }
    
    return maxLength
  }
}

let s = Solution()
print(s.lengthOfLongestSubstring("abcabcbb"))
print(s.lengthOfLongestSubstring("bbbbb"))
print(s.lengthOfLongestSubstring("pwwkew"))
