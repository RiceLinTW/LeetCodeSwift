/*:
 # 219. Contains Duplicate II

 Given an integer array `nums` and an integer `k`, return `true` if there are two distinct indices `i` and `j` in the array such that `nums[i] == nums[j]` and `abs(i - j) <= k`.

 * Callout(Example 1):
 Input: nums = [1,2,3,1], k = 3\
 Output: true
 ---
 * Callout(Example 2):
 Input: nums = [1,0,1,1], k = 1\
 Output: true
 ---
 * Callout(Example 3):
 Input: nums = [1,2,3,1,2,3], k = 2\
 Output: false
 ---

 **Constraints:**
 - 1 <= nums.length <= 10^5
 - -10^9 <= nums[i] <= 10^9
 - 0 <= k <= 10^5
 */
class Solution {
  func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var window = Set<Int>()
    
    for i in 0 ..< nums.count {
      
      if window.contains(nums[i]) {
        return true
      }
      
      window.insert(nums[i])
      
      if window.count > k {
        window.remove(nums[i - k])
      }
    }
    
    return false
  }
}

let s = Solution()
print(s.containsNearbyDuplicate([1, 2, 3, 1], 3))
print(s.containsNearbyDuplicate([1, 0, 1, 1], 1))
print(!s.containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2))
