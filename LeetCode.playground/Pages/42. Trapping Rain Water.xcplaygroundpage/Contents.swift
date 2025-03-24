/*:
 # 42. Trapping Rain Water

 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

 * Callout(Example 1):
 ![Image](rainwatertrap.png)\
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]\
 Output: 6\
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 ---
 * Callout(Example 2):
 Input: height = [4,2,0,3,2,5]\
 Output: 9

 **Constraints:**
 - n == height.length
 - 1 <= n <= 2 * 10^4
 - 0 <= height[i] <= 10^5
 */
class Solution {
  func trap(_ height: [Int]) -> Int {
    let n = height.count
    guard n > 2 else {
      return 0
    }
    
    var waterTrapped = 0
    var leftMax = 0, rightMax = 0
    var leftIndex = 0, rightIndex = n - 1
    
    while leftIndex < rightIndex {
      if height[leftIndex] < height[rightIndex] {

        if height[leftIndex] >= leftMax {
          leftMax = height[leftIndex]
        } else {
          waterTrapped += leftMax - height[leftIndex]
        }

        leftIndex += 1
      } else {
        if height[rightIndex] >= rightMax {
          rightMax = height[rightIndex]
        } else {
          waterTrapped += rightMax - height[rightIndex]
        }
        
        rightIndex -= 1
      }
    }
    
    return waterTrapped
  }
}

let s = Solution()
print(s.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
print(s.trap([4,2,0,3,2,5]) == 9)
