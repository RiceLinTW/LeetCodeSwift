/*:
 # 57. Insert Interval

 You are given an array of non-overlapping intervals `intervals` where `intervals[i] = [starti, endi]` represent the start and the end of the `ith` interval and `intervals` is sorted in ascending order by `starti`. You are also given an interval `newInterval = [start, end]` that represents the start and end of another interval.

 Insert `newInterval` into `intervals` such that `intervals` is still sorted in ascending order by `starti` and `intervals` still does not have any overlapping intervals (merge overlapping intervals if necessary).

 Return `intervals` after the insertion.

 Note that you don't need to modify `intervals` in-place. You can make a new array and return it.

 * Callout(Example 1):
 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]\
 Output: [[1,5],[6,9]]
 ---
 * Callout(Example 2):
 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]\
 Output: [[1,2],[3,10],[12,16]]\
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
 ---

 **Constraints:**
 - 0 <= intervals.length <= 10^4
 - intervals[i].length == 2
 - 0 <= starti <= endi <= 10^5
 - intervals is sorted by starti in ascending order.
 - newInterval.length == 2
 - 0 <= start <= end <= 10^5
 */
class Solution {
  func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = [[Int]]()
    
    var new = newInterval
    var index = 0
    
    while index < intervals.count && intervals[index][1] < new[0] {
      result.append(intervals[index])
      index += 1
    }
    
    while index < intervals.count && intervals[index][0] <= new[1] {
      new[0] = min(new[0], intervals[index][0])
      new[1] = max(new[1], intervals[index][1])
      index += 1
    }
    result.append(new)
    
    while index < intervals.count {
      result.append(intervals[index])
      index += 1
    }
    
    return result
  }
}

let s = Solution()
print(s.insert([[1, 3], [6, 9]], [2, 5]) == [[1, 5], [6, 9]])
print(s.insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]) == [[1, 2], [3, 10], [12, 16]])
