/*:
 # 383. Ransom Note

 Given two strings `ransomNote` and `magazine`, return true if `ransomNote` can be constructed by using the letters from `magazine` and `false` otherwise.

 Each letter in `magazine` can only be used once in `ransomNote`.

 * Callout(Example 1):
 Input: ransomNote = "a", magazine = "b"\
 Output: false
 ---
 * Callout(Example 2):
 Input: ransomNote = "aa", magazine = "ab"\
 Output: false
 ---
 * Callout(Example 3):
 Input: ransomNote = "aa", magazine = "aab"\
 Output: true
 ---

 **Constraints:**
 - 1 <= ransomNote.length, magazine.length <= 10^5
 - ransomNote and magazine consist of lowercase English letters.
 */
class Solution {
  func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var counts = [Int](repeating: 0, count: 26)
    
    for char in magazine {
      counts[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
    }
    
    for char in ransomNote {
      let index = Int(char.asciiValue! - Character("a").asciiValue!)
      counts[index] -= 1
      
      if counts[index] < 0 {
        return false
      }
    }
    
    return true
  }
}

let s = Solution()
print(s.canConstruct("a", "b") == false)
print(s.canConstruct("aa", "ab") == false)
print(s.canConstruct("aa", "aab") == true)
