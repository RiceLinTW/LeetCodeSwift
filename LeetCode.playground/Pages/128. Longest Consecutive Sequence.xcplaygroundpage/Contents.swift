/*:
 # 128. Longest Consecutive Sequence

 Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.

 You must write an algorithm that runs in `O(n)` time.

 * Callout(Example 1):
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 ---
 * Callout(Example 2):
 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9
 ---
 * Callout(Example 3):
 Input: nums = [1,0,1,2]
 Output: 3
 ---

 **Constraints:**
 - 0 <= nums.length <= 10^5
 - -10^9 <= nums[i] <= 10^9
 */
class Solution {
  func longestConsecutive(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var maxLength = 0
    var numSet = Set(nums)
    
    for num in numSet {
      guard !numSet.contains(num - 1) else { continue }
      
      var currentNum = num
      var length = 1
      
      while numSet.contains(currentNum + 1) {
        length += 1
        currentNum += 1
      }
      
      maxLength = max(maxLength, length)
    }
    
    return maxLength
  }
}

let s = Solution()
print(s.longestConsecutive([100, 4, 200, 1, 3, 2]) == 4)
print(s.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9)
print(s.longestConsecutive([1, 0, 1, 2]) == 3)
