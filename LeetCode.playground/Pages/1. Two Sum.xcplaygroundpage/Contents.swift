/*:
 # 1. Two Sum

 Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

 * Callout(Example 1):
 Input: nums = [2,7,11,15], target = 9\
 Output: [0,1]\
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 ---
 * Callout(Example 2):
 Input: nums = [3,2,4], target = 6\
 Output: [1,2]
 ---
 * Callout(Example 3):
 Input: nums = [3,3], target = 6\
 Output: [0,1]
 ---

 **Constraints:**
 - 2 <= nums.length <= 10^4
 - -10^9 <= nums[i] <= 10^9
 - -10^9 <= target <= 10^9
 - Only one valid answer exists.

 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
 */
class Solution {
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    
    for (i, num) in nums.enumerated() {
      let complement = target - num
      if let j = map[complement] {
        return [j, i]
      }
      
      map[num] = i
    }
    
    return []
  }
}

let s = Solution()
print(s.twoSum([2, 7, 11, 15], 9))
print(s.twoSum([3, 2, 4], 6))
print(s.twoSum([3, 3], 6))
