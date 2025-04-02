class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp: [Int] = [Int](repeating: Int.max, count: cost.count+1)
        
        dp[0] = cost[0]
        dp[1] = cost[1]
        
        for i in 2..<cost.count {
            dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
        }
        
        dp[cost.count] = min(dp[cost.count-1], dp[cost.count-2])
        
        return dp[cost.count]
    }
}