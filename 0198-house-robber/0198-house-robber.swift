class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var dp: [Int] = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }
        return dp.last!
    }
}