import Foundation

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: dungeons.count)
    return dfs(dungeons, &visited, k, 0)
}

func dfs(_ dungeons: [[Int]], _ visited: inout [Bool], _ k: Int, _ count: Int) -> Int {
    // 현재 탐험 가능한 던전 수로 초기화
    var maxCount = count
    
    // 모든 던전에 대해 탐험 가능 여부 확인
    for i in 0..<dungeons.count {
        // 던전을 방문하지 않았고 현재 체력으로 탐험 가능한 경우
        if !visited[i] && dungeons[i][0] <= k {
            // 던전 방문 처리
            visited[i] = true
            
            // 체력 소모 후 다시 탐색
            maxCount = max(maxCount, dfs(dungeons, &visited, k - dungeons[i][1], count + 1))
            
            // 던전 방문 처리 해제
            visited[i] = false
        }
    }
    
    return maxCount
}