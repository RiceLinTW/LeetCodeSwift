/*:
 # 209. Minimum Size Subarray Sum

 Given an array of positive integers `nums` and a positive integer `target`, return the minimal length of a subarray(*1) whose sum is greater than or equal to `target`. If there is no such subarray, return `0` instead.

 *1: A subarray is a contiguous non-empty sequence of elements within an array.

 * Callout(Example 1):
 Input: target = 7, nums = [2,3,1,2,4,3]\
 Output: 2\
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 ---
 * Callout(Example 2):
 Input: target = 4, nums = [1,4,4]\
 Output: 1
 ---
 * Callout(Example 3):
 Input: target = 11, nums = [1,1,1,1,1,1,1,1]\
 Output: 0
 ---

 **Constraints:**
 - 1 <= target <= 10^9
 - 1 <= nums.length <= 10^5
 - 1 <= nums[i] <= 10^4

 Follow up: If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log(n)).
 */
class Solution {
  func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var left = 0
    var sum = 0
    var minLength = Int.max
    
    for right in 0 ..< nums.count {
      sum += nums[right]
      
      while sum >= target {
        minLength = min(minLength, right - left + 1)
        sum -= nums[left]
        left += 1
      }
    }
    
    return minLength == Int.max ? 0 : minLength
  }
}

let s = Solution()
print(s.minSubArrayLen(7, [2, 3, 1, 2, 4, 3]))
print(s.minSubArrayLen(4, [1, 4, 4]))
print(s.minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]))
