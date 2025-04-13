/*:
 # 228. Summary Ranges

 You are given a sorted unique integer array `nums`.

 A range `[a,b]` is the set of all integers from `a` to `b` (inclusive).

 Return the smallest sorted list of ranges that cover all the numbers in the array exactly. That is, each element of `nums` is covered by exactly one of the ranges, and there is no integer `x` such that `x` is in one of the ranges but not in `nums`.

 Each range `[a,b]` in the list should be output as:
 - "a->b" if a != b
 - "a" if a == b

 * Callout(Example 1):
 Input: nums = [0,1,2,4,5,7]\
 Output: ["0->2","4->5","7"]\
 Explanation: The ranges are:\
 [0,2] --> "0->2"\
 [4,5] --> "4->5"\
 [7,7] --> "7"
 ---
 * Callout(Example 2):
 Input: nums = [0,2,3,4,6,8,9]\
 Output: ["0","2->4","6","8->9"]\
 Explanation: The ranges are:\
 [0,0] --> "0"\
 [2,4] --> "2->4"\
 [6,6] --> "6"\
 [8,9] --> "8->9"
 ---

 **Constraints:**
 - 0 <= nums.length <= 20
 - -2^31 <= nums[i] <= 2^31 - 1
 - All the values of nums are unique.
 - nums is sorted in ascending order.
 */
class Solution {
  func summaryRanges(_ nums: [Int]) -> [String] {
    guard !nums.isEmpty else { return [] }

    var result = [String]()
    var start = nums[0]

    for i in 1 ..< nums.count {
      if nums[i] != nums[i - 1] + 1 {
        result.append(start == nums[i - 1] ? "\(start)" : "\(start)->\(nums[i - 1])")
        start = nums[i]
      }
    }

    result.append(start == nums.last! ? "\(start)" : "\(start)->\(nums.last!)")

    return result
  }
}

let s = Solution()
print(s.summaryRanges([0, 1, 2, 4, 5, 7]) == ["0->2", "4->5", "7"])
print(s.summaryRanges([0, 2, 3, 4, 6, 8, 9]) == ["0", "2->4", "6", "8->9"])
