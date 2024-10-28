import Foundation

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    let n = dungeons.count
    // 던전들을 필요 체력에 따라 정렬합니다.
    let sortedDungeons = dungeons.sorted { $0[0] - $0[1] < $1[0] - $1[1] }
    
    // DP 테이블 초기화
    var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

    for i in 1...n {
        for r in 1...k {
            if sortedDungeons[i - 1][0] > r {
                dp[i][r] = dp[i - 1][r]
            } else {
                dp[i][r] = max(dp[i - 1][r], 1 + dp[i - 1][r - sortedDungeons[i - 1][1]])
            }
        }
    }
    
    return dp[n][k]
}