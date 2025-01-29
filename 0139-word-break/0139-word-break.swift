class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let wordSet = Set(wordDict)
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        
        for i in 1...s.count {
            for j in 0..<i {
                let substring = String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])
                if dp[j] && wordSet.contains(substring) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[s.count]
    }

}