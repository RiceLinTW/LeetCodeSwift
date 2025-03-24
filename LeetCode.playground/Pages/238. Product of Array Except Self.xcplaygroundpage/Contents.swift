/*:
 # 238. Product of Array Except Self

 Given an integer array `nums`, return an `array` answer such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`.

 The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in `O(n)` time and without using the division operation.

 * Callout(Example 1):
 Input: nums = [1,2,3,4]\
 Output: [24,12,8,6]
 ---
 * Callout(Example 2):
 Input: nums = [-1,1,0,-3,3]\
 Output: [0,0,9,0,0]

 **Constraints:**
 - 2 <= nums.length <= 10^5
 - -30 <= nums[i] <= 30
 - The input is generated such that answer[i] is guaranteed to fit in a 32-bit integer.

 Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
 */
class Solution {
  func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var i = 0
    
    var answers = Array(repeating: 1, count: n)
    var left = 1
    
    while i < n {
      answers[i] = left
      left *= nums[i]
      i += 1
    }
    
    var right = 1
    i = n - 1
    while i >= 0 {
      answers[i] *= right
      right *= nums[i]
      i -= 1
    }
    
    return answers
  }
}

let s = Solution()
let input1: [Int] = [1, 2, 3, 4]
let input2: [Int] = [-1, 1, 0, -3, 3]

let ans1 = s.productExceptSelf(input1)
let ans2 = s.productExceptSelf(input2)

print(ans1 == [24, 12, 8, 6])
print(ans2 == [0, 0, 9, 0, 0])
