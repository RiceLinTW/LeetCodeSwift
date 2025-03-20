/*:
 # 45. Jump Game lI

 You are given a **0-indexed** array of integers `nums` of length `n`. You are initially positioned at `nums[0]`.

 Each element `nums[i]` represents the maximum length of a forward jump from index `i`. In other words, if you are at `nums[i]`, you can jump to any `nums[i + j]` where:

 - `0 <= j <= nums[i]` and
 - `i + j < n`

 Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].

 * Callout(Example 1):
 Input: nums = [2,3,1,1,4]\
 Output: 2\
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
 ---
 * Callout(Example 2):
 Input: nums = [2,3,0,1,4]\
 Output: 2
 ---
 **Constraints:**
 - 1 <= nums.length <= 10^4
 - 0 <= nums[i] <= 1000
 - It's guaranteed that you can reach nums[n - 1].
 */
class Solution {
  func jump(_ nums: [Int]) -> Int {
    var jumps = 0
    var currentEnd = 0
    var farthest = 0
    let n = nums.count
    var i = 0

    while i < n - 1 {
      farthest = max(farthest, i + nums[i])

      if i == currentEnd {
        jumps += 1
        currentEnd = farthest

        if currentEnd >= n - 1 {
          break
        }
      }
      i += 1
    }

    return jumps
  }
}

let s = Solution()
print(s.jump([2, 3, 1, 1, 4]))
print(s.jump([2, 3, 0, 1, 4]))
