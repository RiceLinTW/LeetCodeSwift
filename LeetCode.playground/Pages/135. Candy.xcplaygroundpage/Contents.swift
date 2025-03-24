/*:
 # 135. Candy

 There are `n` children standing in a line. Each child is assigned a rating value given in the integer array `ratings`.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.

 * Callout(Example 1):
 Input: ratings = [1,0,2]\
 Output: 5\
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 ---
 * Callout(Example 2):
 Input: ratings = [1,2,2]\
 Output: 4\
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.\
 The third child gets 1 candy because it satisfies the above two conditions.
 ---

 **Constraints:**
 - n == ratings.length
 - 1 <= n <= 2 * 10^4
 - 0 <= ratings[i] <= 2 * 10^4
 */
class Solution {
  func candy(_ ratings: [Int]) -> Int {
    let n = ratings.count
    var candies = Array(repeating: 1, count: n)

    for i in 1 ..< n {
      if ratings[i] > ratings[i-1] {
        candies[i] = candies[i-1] + 1
      }
    }

    for i in (0 ..< n-1).reversed() {
      if ratings[i] > ratings[i + 1] {
        candies[i] = max(candies[i], candies[i + 1] + 1)
      }
    }

    return candies.reduce(0, +)
  }
}

let s = Solution()

print(s.candy([1, 0, 2]) == 5)
print(s.candy([1, 2, 2]) == 4)
