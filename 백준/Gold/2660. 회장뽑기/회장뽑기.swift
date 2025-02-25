import Foundation

let INF = 987654321
let N = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: INF, count: N + 1), count: N + 1)

for i in 1...N {
    graph[i][i] = 0
}

while true {
    let input = readLine()!
    let components = input.split(separator: " ").map { Int($0)! }
    
    let x = components[0]
    let y = components[1]
    
    if x == -1 && y == -1 { break }
    
    graph[x][y] = 1
    graph[y][x] = 1
}

for k in 1...N {
    for i in 1...N {
        for j in 1...N {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

// 친구 점수 계산
var readerScore = INF
var scoreArr = Array(repeating: 0, count: N + 1)

for i in 1...N {
    var score = 0
    for j in 1...N {
        if graph[i][j] != INF {
            score = max(score, graph[i][j])
        }
    }
    
    scoreArr[i] = score
    readerScore = min(readerScore, score)
}

var title = "\(readerScore) "
var readerNum = 0
var body = ""

for i in 1...N {
    if readerScore == scoreArr[i] {
        readerNum += 1
        body += "\(i) "
    }
}

title += "\(readerNum)\n"
print(title + body)
