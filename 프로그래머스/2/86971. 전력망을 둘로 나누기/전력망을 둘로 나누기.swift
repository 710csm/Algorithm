import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    for i in 1...n{
        graph.updateValue([], forKey: i)
    }
    
    for wire in wires{
        graph[wire[0]]?.append(wire[1])
        graph[wire[1]]?.append(wire[0])
    }
    
    var visit = [Bool](repeating: false, count: n + 1)
    visit[1] = true
    
    let count = bfs(2, graph: graph, visit: &visit)
    var result = abs(count - (n - count))
    
    for i in 1...n {
        visit = Array(repeating: false, count: n + 1)
        visit[i] = true
        
        let count = bfs(1, graph: graph, visit: &visit)
        result = min(result, abs(count  - (n - count)))
    }
    
    return result
}

func bfs(_ start: Int, graph: [Int: [Int]], visit: inout [Bool]) -> Int{
    var queue = [Int]()
    var count = 0
    queue.append(start)
    visit[start] = true
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        count += 1
        
        for i in graph[now]! {
            if !visit[i] {
                queue.append(i)
                visit[i] = true
            }
        }
    }
    return count
}