/*:
 # 121. Best Time to Buy and Sell Stock

 You are given an array `prices` where `prices[i]` is the price of a given stock on the `ith` day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return `0`.

 * Callout(Example 1):
 Input: prices = [7,1,5,3,6,4]\
 Output: 5\
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.\
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 ---
 * Callout(Example 2):
 Input: prices = [7,6,4,3,1]\
 Output: 0\
 Explanation: In this case, no transactions are done and the max profit = 0.
 ---
 **Constraints:**
 - 1 <= prices.length <= 10^5
 - 0 <= prices[i] <= 10^4
 */
class Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }

    var minPrice = prices[0]
    var maxProfit = 0

    for price in prices {
        minPrice = min(minPrice, price)
        maxProfit = max(maxProfit, price - minPrice)
    }

    return maxProfit
  }
}

let solution = Solution()
let input1: [Int] = [7, 1, 5, 3, 6, 4]
let input2: [Int] = [7, 6, 4, 3, 1]

let result1 = solution.maxProfit(input1)
print(result1)
let result2 = solution.maxProfit(input2)
print(result2)
