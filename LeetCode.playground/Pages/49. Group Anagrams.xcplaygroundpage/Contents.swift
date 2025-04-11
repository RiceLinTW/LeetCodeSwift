/*:
 # 49. Group Anagrams

 Given an array of strings `strs`, group the anagrams(*1) together. You can return the answer in **any order**.

 *1: An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, using all the original letters exactly once.

 * Callout(Example 1):
 Input: strs = ["eat","tea","tan","ate","nat","bat"]\
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]\
 Explanation:\
 There is no string in strs that can be rearranged to form "bat".\
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.\
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 ---
 * Callout(Example 2):
 Input: strs = [""]\
 Output: [[""]]
 ---
 * Callout(Example 3):
 Input: strs = ["a"]\
 Output: [["a"]]
 ---

 **Constraints:**
 - 1 <= strs.length <= 104
 - 0 <= strs[i].length <= 100
 - strs[i] consists of lowercase English letters.
 */
class Solution {
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var groups: [String: [String]] = [:]
    
    for str in strs {
      
      var count = [Int](repeating: 0, count: 26)
      
      for char in str {
        count[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
      }
      
      let key = count.map(String.init).joined(separator: "#")
      groups[key, default: []].append(str)
    }
    
    return Array(groups.values)
  }
}

let s = Solution()
print(s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
print(s.groupAnagrams([""]))
print(s.groupAnagrams(["a"]))
