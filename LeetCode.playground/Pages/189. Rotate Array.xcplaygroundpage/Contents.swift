/*:
  # 189. Rotate Array

  Given an integer array `nums`, rotate the array to the right by `k` steps, where `k` is non-negative.

  * Callout(Example 1):
  Input: nums = [1,2,3,4,5,6,7], k = 3\
  Output: [5,6,7,1,2,3,4]\
  Explanation:\
  rotate 1 steps to the right: [7,1,2,3,4,5,6]\
  rotate 2 steps to the right: [6,7,1,2,3,4,5]\
  rotate 3 steps to the right: [5,6,7,1,2,3,4]
  ---
  * Callout(Example 2):
  Input: nums = [-1,-100,3,99], k = 2\
  Output: [3,99,-1,-100]\
  Explanation:\
  rotate 1 steps to the right: [99,-1,-100,3]\
  rotate 2 steps to the right: [3,99,-1,-100]

  **Constraints:**
 - 1 <= nums.length <= 10^5
 - -2^31 <= nums[i] <= 2^31 - 1
 - 0 <= k <= 10^5

  **Follow up:**
  Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
  Could you do it in-place with O(1) extra space?
   */
class Solution {
  func rotate(_ nums: inout [Int], _ k: Int) {
    let k = k % nums.count
    nums.reverse()
    nums[0..<k].reverse()
    nums[k..<nums.count].reverse()
  }
}

var nums1 = [1, 2, 3, 4, 5, 6, 7]
let k1 = 3
var nums2 = [-1, -100, 3, 99]
let k2 = 2

let s = Solution()

s.rotate(&nums1, k1)
print(nums1)

s.rotate(&nums2, k2)
print(nums2)
