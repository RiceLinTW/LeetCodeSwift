/*:
 # 169. Majority Element

 Given an array `nums` of size `n`, return the majority element.

 The majority element is the element that appears more than `[n / 2]` times. You may assume that the majority element always exists in the array.

 * Callout(Example 1):
 Input: nums = [3,2,3]
 Output: 3
 ---
 * Callout(Example 2):
 Input: nums = [2,2,1,1,1,2,2]
 Output: 2

 **Constraints:**
 - n == nums.length
 - 1 <= n <= 5 * 104
 - -10^9 <= nums[i] <= 10^9

 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */
class Solution {
  func majorityElement(_ nums: [Int]) -> Int {
    var candidate = 0, count = 0

    for num in nums {
      if count == 0 {
        candidate = num
      }
      count += (num == candidate) ? 1 : -1
      print(count)
    }

    return candidate
  }
}

let s = Solution()

let input1: [Int] = [3, 2, 3]
print(s.majorityElement(input1) == 3)

let input2: [Int] = [2, 2, 1, 1, 1, 2, 2]
print(s.majorityElement(input2) == 2)
