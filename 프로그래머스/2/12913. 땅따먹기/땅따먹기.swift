import Foundation

func solution(_ land: [[Int]]) -> Int {
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 4), count: land.count)
    
    dp[0][0] = land[0][0]
    dp[0][1] = land[0][1]
    dp[0][2] = land[0][2]
    dp[0][3] = land[0][3]
    
    for i in 1..<land.count {
        for j in 0..<land[i].count {
            if j == 0 {
                dp[i][j] = max(dp[i-1][1], dp[i-1][2], dp[i-1][3]) + land[i][j]
            } else if j == 1 {
                dp[i][j] = max(dp[i-1][0], dp[i-1][2], dp[i-1][3]) + land[i][j]
            } else if j == 2 {
                dp[i][j] = max(dp[i-1][0], dp[i-1][1], dp[i-1][3]) + land[i][j]
            } else if j == 3 {
                dp[i][j] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2]) + land[i][j]
            }
        }
    }
    
    return max(dp[land.count-1][0], dp[land.count-1][1], dp[land.count-1][2], dp[land.count-1][3])
}
