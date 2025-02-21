import Foundation

let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!

var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
var result: Int = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0], v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

func dfs(node: Int) {
    visited[node] = true
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            visited[nextNode] = true
            dfs(node: nextNode)
        }
    }
}

for i in 1...n {
    if !visited[i] {
        result += 1
        dfs(node: i)
    }
}

print(result)
