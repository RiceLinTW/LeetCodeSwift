/*:
 # 20. Valid Parentheses

 Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.

 * Callout(Example 1):
 Input: s = "()"\
 Output: true
 ---
 * Callout(Example 2):
 Input: s = "()[]{}"\
 Output: true
 ---
 * Callout(Example 3):
 Input: s = "(]"\
 Output: false
 ---
 * Callout(Example 4):
 Input: s = "([])"\
 Output: true
 ---

 **Constraints:**
 - 1 <= s.length <= 104
 - s consists of parentheses only '()[]{}'.
 */
class Solution {
  func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    
    for char in s {
      if let match = pairs[char] {
        guard stack.popLast() == match else { return false }
      } else {
        stack.append(char)
      }
    }

    return stack.isEmpty
  }
}

let s = Solution()
print(s.isValid("()") == true)
print(s.isValid("()[]{}") == true)
print(s.isValid("(]") == false)
print(s.isValid("([])") == true)
