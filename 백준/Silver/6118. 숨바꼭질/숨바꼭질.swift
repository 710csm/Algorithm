import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var graph: [[Int]] = Array(repeating: [Int](), count: n + 1)
var distance = Array(repeating: 0, count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let a = edge[0]
    let b = edge[1]
    graph[a].append(b)
    graph[b].append(a)
}

func bfs(start: Int) {
    var queue = [start]
    distance[start] = 1
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for neighbor in graph[node] {
            if distance[neighbor] == 0 {
                distance[neighbor] = distance[node] + 1
                queue.append(neighbor)
            }
        }
    }
}

bfs(start: 1)

let maxDistance = distance.max()!
let farthestNode = distance.firstIndex(of: maxDistance)!
let countOfMaxDistance = distance.filter { $0 == maxDistance }.count

print(farthestNode, maxDistance - 1, countOfMaxDistance)
