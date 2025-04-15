/*:
 # 224. Basic Calculator

 Given a string `s` representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as `eval()`.

 * Callout(Example 1):
 Input: s = "1 + 1"\
 Output: 2
 ---
 * Callout(Example 2):
 Input: s = " 2-1 + 2 "\
 Output: 3
 ---
 * Callout(Example 3):
 Input: s = "(1+(4+5+2)-3)+(6+8)"\
 Output: 23

 **Constraints:**
 - 1 <= s.length <= 3 * 10^5
 - s consists of digits, '+', '-', '(', ')', and ' '.
 - s represents a valid expression.
 - '+' is not used as a unary operation (i.e., "+1" and "+(2 + 3)" is invalid).
 - '-' could be used as a unary operation (i.e., "-1" and "-(2 + 3)" is valid).
 - There will be no two consecutive operators in the input.
 - Every number and running calculation will fit in a signed 32-bit integer.
 */
class Solution {
  func calculate(_ s: String) -> Int {
    var stack: [Int] = []
    var res = 0, num = 0, sign = 1

    let sArray = Array(s)

    for char in sArray {
      switch char {
      case "0" ... "9":
        num = num * 10 + Int(String(char))!
      case "+":
        res += sign * num
        num = 0
        sign = 1
      case "-":
        res += sign * num
        num = 0
        sign = -1
      case "(":
        stack.append(res)
        stack.append(sign)
        res = 0
        sign = 1
      case ")":
        res += num * sign
        num = 0
        res *= stack.removeLast()
        res += stack.removeLast()
      case " ":
        continue
      default:
        break
      }
    }

    return res + num * sign
  }
}

let s = Solution()
print(s.calculate("1 + 1") == 2)
print(s.calculate(" 2-1 + 2 ") == 3)
print(s.calculate("(1+(4+5+2)-3)+(6+8)") == 23)
