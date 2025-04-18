/*:
 # 202. Happy Number

 Write an algorithm to determine if a number `n` is happy.

 A **happy number** is a number defined by the following process:
 - Starting with any positive integer, replace the number by the sum of the squares of its digits.
 - Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 - Those numbers for which this process ends in 1 are happy.

 Return `true` if n is a happy number, and `false` if not.

 * Callout(Example 1):
 Input: n = 19\
 Output: true\
 Explanation:\
 1^2 + 9^2 = 82\
 8^2 + 2^2 = 68\
 6^2 + 8^2 = 100\
 1^2 + 0^2 + 0^2 = 1
 ---
 * Callout(Example 2):
 Input: n = 2\
 Output: false
 ---

 **Constraints:**
 - 1 <= n <= 2^31 - 1
 */
class Solution {
  func isHappy(_ n: Int) -> Bool {
    var seen = Set<Int>()
    var current = n
    
    while current != 1 {
      guard !seen.contains(current) else { return false }
      
      seen.insert(current)
      
      var sum = 0
      var num = current
      while num != 0 {
        let digit = num % 10
        sum += digit * digit
        num /= 10
      }
      
      current = sum
    }
    
    return true
  }
}

let s = Solution()
print(s.isHappy(19) == true)
print(s.isHappy(2) == false)
