/*:
 # 56. Merge Intervals

 Given an array of `intervals` where `intervals[i] = [starti, endi]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

 * Callout(Example 1):
 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]\
 Output: [[1,6],[8,10],[15,18]]\
 Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 ---
 * Callout(Example 2):
 Input: intervals = [[1,4],[4,5]]\
 Output: [[1,5]]\
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 ---

 **Constraints:**
 - 1 <= intervals.length <= 10^4
 - intervals[i].length == 2
 - 0 <= starti <= endi <= 10^4
 */
class Solution {
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    let sorted = intervals.sorted(by: { $0[0] < $1[0] })
    var merged = [[Int]]()
    
    for interval in sorted {
      guard let last = merged.last, last[1] >= interval[0] else {
        merged.append(interval)
        continue
      }
      
      merged[merged.count - 1] = [last[0], max(last[1], interval[1])]
    }

    return merged
  }
}

let s = Solution()
print(s.merge([[1, 3], [2, 6], [8, 10], [15, 18]]) == [[1, 6], [8, 10], [15, 18]])
print(s.merge([[1, 4], [4, 5]]) == [[1, 5]])
