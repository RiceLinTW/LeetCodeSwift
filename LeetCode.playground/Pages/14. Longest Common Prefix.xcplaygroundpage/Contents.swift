/*:
 # 14. Longest Common Prefix

 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string `""`.

 * Callout(Example 1):
 Input: strs = ["flower","flow","flight"]\
 Output: "fl"
 ---
 * Callout(Example 2):
 Input: strs = ["dog","racecar","car"]\
 Output: ""\
 Explanation: There is no common prefix among the input strings.
 ---

 **Constraints:**
 - 1 <= strs.length <= 200
 - 0 <= strs[i].length <= 200
 - strs[i] consists of only lowercase English letters if it is non-empty.
 */
class Solution {
  func longestCommonPrefix(_ strs: [String]) -> String {
    guard let first = strs.first else { return "" }

    var prefix = first

    for str in strs[1...] {
      while !str.hasPrefix(prefix) {
        prefix.removeLast()
        if prefix.isEmpty { return "" }
      }
    }

    return prefix
  }
}

let s = Solution()
print(s.longestCommonPrefix(["flower", "flow", "flight"]))
print(s.longestCommonPrefix(["dog", "racecar", "car"]))
