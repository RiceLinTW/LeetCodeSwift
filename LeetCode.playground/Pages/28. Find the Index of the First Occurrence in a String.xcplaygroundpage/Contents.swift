/*:
 # 28. Find the Index of the First Occurrence in a String

 Given two strings `needle` and `haystack`, return the index of the first occurrence of `needle` in `haystack`, or `-1` if `needle` is not part of `haystack`.

 * Callout(Example 1):
 Input: haystack = "sadbutsad", needle = "sad"\
 Output: 0\
 Explanation: "sad" occurs at index 0 and 6.\
 The first occurrence is at index 0, so we return 0.
 * Callout(Example 2):
 Input: haystack = "leetcode", needle = "leeto"\
 Output: -1\
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
 ---

 **Constraints:**
 - 1 <= haystack.length, needle.length <= 104
 - haystack and needle consist of only lowercase English characters.
 */
class Solution {
  func strStr(_ haystack: String, _ needle: String) -> Int {
    if let range = haystack.firstRange(of: needle) {
      return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
    }

    return -1
  }
}

let s = Solution()
print(s.strStr("sadbutsad", "sad"))
print(s.strStr("leetcode", "leeto"))
