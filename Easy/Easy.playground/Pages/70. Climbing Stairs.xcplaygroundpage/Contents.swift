//: [Previous](@previous)

import Foundation

// You are climbing a stair case. It takes n steps to reach to the top.
//
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
// Note: Given n will be a positive integer.
//
// Example 1:
// Input: 2
// Output: 2
// Explanation: There are two ways to climb to the top.
// 1. 1 step + 1 step
// 2. 2 steps
//
// Example 2:
// Input: 3
// Output: 3
// Explanation: There are three ways to climb to the top.
// 1. 1 step + 1 step + 1 step
// 2. 1 step + 2 steps
// 3. 2 steps + 1 step
func climbStairs(_ n: Int) -> Int {
    var array = Array(repeating: 0, count: n + 1)
    return countSteps(n, &array)
}

func countSteps(_ n: Int, _ steps: inout [Int]) -> Int {
    guard n >= 0 else { return 0 }
    guard n != 0 else { return 1 }
    guard steps[n] == 0 else { return steps[n] }
    
    steps[n] = countSteps(n - 1, &steps) + countSteps(n - 2, &steps)
    return steps[n]
}
