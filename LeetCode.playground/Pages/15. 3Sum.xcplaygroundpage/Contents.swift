/*:
 # 15. 3Sum

 Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

 Notice that the solution set must not contain duplicate triplets.

 * Callout(Example 1):
 Input: nums = [-1,0,1,2,-1,-4]\
 Output: [[-1,-1,2],[-1,0,1]]\
 Explanation:\
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.\
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.\
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.\
 The distinct triplets are [-1,0,1] and [-1,-1,2].\
 Notice that the order of the output and the order of the triplets does not matter.
 ---
 * Callout(Example 2):
 Input: nums = [0,1,1]\
 Output: []\
 Explanation: The only possible triplet does not sum up to 0.
 ---
 * Callout(Example 3):
 Input: nums = [0,0,0]\
 Output: [[0,0,0]]\
 Explanation: The only possible triplet sums up to 0.
 ---

 **Constraints:**
 - 3 <= nums.length <= 3000
 - -10^5 <= nums[i] <= 10^5
 */
class Solution {
  func threeSum(_ nums: [Int]) -> [[Int]] {
    
    var result: [[Int]] = []
    var sorted = nums.sorted()
    
    for i in 0 ..< sorted.count - 2 {
      
      if i > 0 && sorted[i] == sorted[i - 1] { continue }
      
      var left = i + 1, right = sorted.count - 1
      
      while left < right {
        let sum = sorted[i] + sorted[left] + sorted[right]

        if sum == 0 {
          result.append([sorted[i], sorted[left], sorted[right]])
          
          while left < right && sorted[left] == sorted[left + 1] { left += 1 }
          while left < right && sorted[right] == sorted[right - 1] { right -= 1 }
          
          left += 1
          right -= 1
        } else if sum < 0 {
          left += 1
        } else {
          right -= 1
        }
      }
    }

    return result
  }
}

let s = Solution()
print(s.threeSum([-1, 0, 1, 2, -1, -4]))
print(s.threeSum([0, 1, 1]))
print(s.threeSum([0, 0, 0]))
