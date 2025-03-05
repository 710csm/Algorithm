import Foundation

struct Point: Equatable {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

let target = 7

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var map: [[String]] = []
var visit: [[Bool]] = Array(repeating: Array(repeating: false, count: 5), count: 5)
var combination: [Point] = Array(repeating: Point(x: 0, y: 0), count: 7)
var result: Int = 0

for _ in 0..<5 {
    map.append(readLine()!.map{ String($0) })
}

func backTracking(_ at: Int, _ depth: Int) {
    if depth == target {
        if check() {
            result+=1
        }
        return
    }

    for i in at..<25 {
        if !visit[i/5][i%5] {
            visit[i/5][i%5] = true
            combination[depth] = Point(x: i/5, y: i%5)
            backTracking(i+1, depth+1)
            visit[i/5][i%5] = false
        }
    }
}

func check() -> Bool {
    var S = 0

    // "S"의 개수를 세기
    for point in combination {
        if map[point.x][point.y] == "S" {
            S += 1
        }
    }

    // "S"의 개수가 4 미만이면 false
    if S < 4 {
        return false
    }

    var temp = combination
    var queue: [Point] = []
    queue.append(combination[0])

    while !queue.isEmpty {
        let current = queue.removeFirst()

        for i in 0..<4 {
            let nextX = current.x + dx[i]
            let nextY = current.y + dy[i]

            // 경계 체크
            if nextX < 0 || nextX >= 5 || nextY < 0 || nextY >= 5 {
                continue
            }

            let nextPoint = Point(x: nextX, y: nextY)
            if let index = temp.firstIndex(of: nextPoint) {
                temp.remove(at: index)
                queue.append(nextPoint)
            }
        }
    }

    return temp.isEmpty
}

backTracking(0, 0)
print(result)
