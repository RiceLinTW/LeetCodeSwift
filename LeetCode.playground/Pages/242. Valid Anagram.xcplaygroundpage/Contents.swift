/*:
 # 242. Valid Anagram

 Given two strings `s` and `t`, return `true` if `t` is an anagram(*1) of `s`, and `false` otherwise.

 *1: An anagram is a word or phrase formed by rearranging the letters of a different word or phrase, using all the original letters exactly once.

 * Callout(Example 1):
 Input: s = "anagram", t = "nagaram"\
 Output: true
 ---
 * Callout(Example 2):
 Input: s = "rat", t = "car"\
 Output: false
 ---

 **Constraints:**
 - 1 <= s.length, t.length <= 5 * 10^4
 - s and t consist of lowercase English letters.

 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */
class Solution {
  func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var count = [Int](repeating: 0, count: 26)
    
    for char in s {
      let index = Int(char.asciiValue! - Character("a").asciiValue!)
      count[index] += 1
    }
    
    for char in t {
      let index = Int(char.asciiValue! - Character("a").asciiValue!)
      guard count[index] > 0 else { return false }
      count[index] -= 1
    }
    
    return count.allSatisfy({ $0 == 0 })
  }
}

let s = Solution()
print(s.isAnagram("anagram", "nagaram") == true)
print(s.isAnagram("rat", "car") == false)
