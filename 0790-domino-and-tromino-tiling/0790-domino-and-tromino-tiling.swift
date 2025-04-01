class Solution {
    func numTilings(_ n: Int) -> Int {
        if n < 3 { return n }
        let mod = 1_000_000_007
        var dp = [1,1,2]
        for i in 3...n {
            dp.append((dp[i-1] * 2 + dp[i-3]) % mod)
        }
        return dp[n]
    }
}