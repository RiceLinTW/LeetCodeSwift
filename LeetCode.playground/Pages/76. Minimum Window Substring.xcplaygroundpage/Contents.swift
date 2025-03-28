/*:
 # 76. Minimum Window Substring

 Given two strings `s` and `t` of lengths `m` and `n` respectively, return the minimum window substring(*1) of `s` such that every character in `t` (including duplicates) is included in the window. If there is no such substring, return the empty string `""`.

 The testcases will be generated such that the answer is unique.

 *1: A substring is a contiguous non-empty sequence of characters within a string.

 * Callout(Example 1):
 Input: s = "ADOBECODEBANC", t = "ABC"\
 Output: "BANC"\
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 ---
 * Callout(Example 2):
 Input: s = "a", t = "a"\
 Output: "a"\
 Explanation: The entire string s is the minimum window.
 ---
 * Callout(Example 3):
 Input: s = "a", t = "aa"\
 Output: ""\
 Explanation: Both 'a's from t must be included in the window.\
 Since the largest window of s only has one 'a', return empty string.
 ---

 **Constraints:**
 - m == s.length
 - n == t.length
 - 1 <= m, n <= 10^5
 - s and t consist of uppercase and lowercase English letters.

 Follow up: Could you find an algorithm that runs in O(m + n) time?
 */
class Solution {
  func minWindow(_ s: String, _ t: String) -> String {
    let sArray = Array(s)
    let tArray = Array(t)

    var dictT: [Character: Int] = [:]
    for c in tArray {
      dictT[c, default: 0] += 1
    }

    var left = 0, right = 0
    var minLen = Int.max
    var start = 0
    var valid = 0
    var window: [Character: Int] = [:]

    while right < sArray.count {
      let char = sArray[right]
      right += 1

      if let _ = dictT[char] {
        window[char, default: 0] += 1
        if window[char] == dictT[char] {
          valid += 1
        }
      }

      // 當所有字母都滿足條件時，開始收縮左指針
      while valid == dictT.count {
        if right - left < minLen {
          minLen = right - left
          start = left
        }

        let leftChar = sArray[left]
        left += 1

        if let _ = dictT[leftChar] {
          if window[leftChar] == dictT[leftChar] {
            valid -= 1
          }
          window[leftChar]! -= 1
        }
      }
    }

    return minLen == Int.max ? "" : String(sArray[start ..< start + minLen])
  }
}

let s = Solution()
print(s.minWindow("ADOBECODEBANC", "ABC"))
print(s.minWindow("a", "a"))
print(s.minWindow("a", "aa"))
