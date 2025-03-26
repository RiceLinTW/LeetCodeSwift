/*:
 # 392. Is Subsequence

 Given two strings `s` and `t`, return `true` if `s` is a **subsequence** of `t`, or `false` otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., `"ace"` is a subsequence of `"abcde"` while `"aec"` is not).

 * Callout(Example 1):
 Input: s = "abc", t = "ahbgdc"\
 Output: true
 ---
 * Callout(Example 2):
 Input: s = "axc", t = "ahbgdc"\
 Output: false
 ---

 **Constraints:**
 - 0 <= s.length <= 100
 - 0 <= t.length <= 10^4
 - `s` and `t` consist only of lowercase English letters.

 Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
 */
class Solution {
  func isSubsequence(_ s: String, _ t: String) -> Bool {
    
    var sIndex = 0, tIndex = 0
    let sChars = Array(s), tChars = Array(t)
    
    while sIndex < sChars.count && tIndex < tChars.count {
      if sChars[sIndex] == tChars[tIndex] {
        sIndex += 1
      }
      tIndex += 1
    }
    
    return sIndex == sChars.count
  }
}

let s = Solution()
print(s.isSubsequence("abc", "ahbgdc") == true)
print(s.isSubsequence("axc", "ahbgdc") == false)
