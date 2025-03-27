/*:
 # 30. Substring with Concatenation of All Words

 You are given a string `s` and an array of strings `words`. All the strings of `words` are of the same length.

 A concatenated string is a string that exactly contains all the strings of any permutation of `words` concatenated.

 For example, if `words = ["ab","cd","ef"]`, then `"abcdef"`, `"abefcd"`, `"cdabef"`, `"cdefab"`, `"efabcd"`, and `"efcdab"` are all concatenated strings. `"acdbef"` is not a concatenated string because it is not the concatenation of any permutation of `words`.
 Return an array of the starting indices of all the concatenated substrings in `s`. You can return the answer in any order.

 * Callout(Example 1):
 Input: s = "barfoothefoobarman", words = ["foo","bar"]\
 Output: [0,9]\
 Explanation:\
 The substring starting at 0 is "barfoo". It is the concatenation of ["bar","foo"] which is a permutation of words.\
 The substring starting at 9 is "foobar". It is the concatenation of ["foo","bar"] which is a permutation of words.
 ---
 * Callout(Example 2):
 Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]\
 Output: []\
 Explanation:\
 There is no concatenated substring.
 ---
 * Callout(Example 3):
 Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]\
 Output: [6,9,12]\
 Explanation:\
 The substring starting at 6 is "foobarthe". It is the concatenation of ["foo","bar","the"].\
 The substring starting at 9 is "barthefoo". It is the concatenation of ["bar","the","foo"].\
 The substring starting at 12 is "thefoobar". It is the concatenation of ["the","foo","bar"].
 ---

 **Constraints:**
 - 1 <= s.length <= 10^4
 - 1 <= words.length <= 5000
 - 1 <= words[i].length <= 30
 - s and words[i] consist of lowercase English letters.
 */
class Solution {
  func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    
    guard !words.isEmpty else { return [] }
    
    let wordLen = words[0].count
    let wordCount = words.count
    
    var dict: [String: Int] = [:]
    let sArray = Array(s)
    words.forEach { dict[$0, default: 0] += 1 }

    var result: [Int] = []

    for i in 0 ..< wordLen {
      var left = i, right = i
      var currentDict: [String: Int] = [:]
      var count = 0

      while right + wordLen <= s.count {
        let rightWord = String(sArray[right ..< right + wordLen])
        right += wordLen

        if dict[rightWord] != nil {
          currentDict[rightWord, default: 0] += 1
          count += 1
          
          while currentDict[rightWord]! > dict[rightWord]! {
            let leftWord = String(sArray[left ..< left + wordLen])
            currentDict[leftWord]! -= 1
            count -= 1
            left += wordLen
          }
          
          if count == wordCount {
            result.append(left)
          }
        } else {
          currentDict.removeAll()
          count = 0
          left = right
        }
      }
    }
    return result
  }
}

let s = Solution()
print(s.findSubstring("barfoothefoobarman", ["foo", "bar"]))
print(s.findSubstring("wordgoodgoodgoodbestword", ["word", "good", "best", "word"]))
print(s.findSubstring("barfoofoobarthefoobarman", ["bar", "foo", "the"]))
print(s.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
