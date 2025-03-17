class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        if isConnected.isEmpty { return 0 }
        
        let length = isConnected.count
        var num: Int = 0
        var visited = [Bool](repeating: false, count: length)
        
        for i in 0..<length where !visited[i] {
            num += 1
            visited[i] = true
            
            var queue = [i]
            
            while !queue.isEmpty {
                let city = queue.removeFirst()
                for j in 0..<length where !visited[j] && isConnected[city][j] == 1 {
                    visited[j] = true
                    queue.append(j)
                }
            }
        }
        return num
    }
}