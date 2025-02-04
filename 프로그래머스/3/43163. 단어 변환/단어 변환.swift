import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let words = [begin] + words
    let targetIndex = words.firstIndex(of: target)
    let n = words.count
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    if !words.contains(target) {
        return 0
    }
    
    for i in 1..<n {
        for j in i+1...n {
            if getDistance(words[i-1], words[j-1]) == 1 {
                graph[i][j] = 1
                graph[j][i] = 1
            }
        }
    }
    
    func dijkstra(_ start: Int, _ to: Int) -> Int {
        let INF = Int.max
        var distance = [Int](repeating: INF, count: n+1)
        var queue = [start]
        distance[start] = 0
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            for i in 1...n where graph[first][i] != 0 {
                let cost = distance[first] + 1
                if distance[i] > cost {
                    distance[i] = cost
                    queue.append(i)
                }
            }
        }
        return distance[to]
    }
    return dijkstra(1, targetIndex! + 1)
}

func getDistance(_ current: String, _ next: String) -> Int {
    return zip(Array(current), Array(next)).filter {$0 != $1}.count
}