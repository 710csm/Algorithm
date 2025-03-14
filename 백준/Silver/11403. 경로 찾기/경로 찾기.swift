
import Foundation

let n = Int(readLine()!)!
var graph: [[Int]] = []
var visited = [Bool](repeating: false, count: n)
var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func dfs(start: Int, now: Int) {
    for i in 0..<n {
        if graph[now][i] == 1 && !visited[i] {
            result[start][i] = 1
            visited[i] = true
            dfs(start: start, now: i)
        }
    }
}

for i in 0..<n {
    dfs(start: i, now: i)
    visited = [Bool](repeating: false, count: n)
}

for j in result {
    for r in j {
        print(r, terminator: " ")
    }
    print()
}