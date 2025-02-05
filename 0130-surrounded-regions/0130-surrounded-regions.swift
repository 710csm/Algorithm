class Solution {
    struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }

    func solve(_ board: inout [[Character]]) {
        let m = board.count
        let n = board[0].count
        var visited: Set<Point> = []
        
        for i in 0..<m {
            for j in 0..<n {
                let currentPoint = Point(x: i, y: j)
                
                if board[i][j] == "O" && !visited.contains(currentPoint) {
                    var queue: [Point] = [currentPoint]
                    var surroundedQueue: [Point] = [currentPoint]
                    visited.insert(currentPoint)
                    
                    if findSurroundedRegion(&board, &visited, &queue, &surroundedQueue, m, n) {
                        removeSurroundedRegion(&board, surroundedQueue)
                    }
                }
            }
        }
    }

    func findSurroundedRegion(
        _ board: inout [[Character]], _ visited: inout Set<Point>,
        _ queue: inout [Point], _ surroundedQueue: inout [Point],
        _ m: Int, _ n: Int
    ) -> Bool {
        let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        while !queue.isEmpty {
            let point = queue.removeFirst()
            
            for direction in directions {
                let nx = point.x + direction.0
                let ny = point.y + direction.1
                
                if nx >= 0, nx < m, ny >= 0, ny < n {
                    let nextPoint = Point(x: nx, y: ny)
                    if board[nx][ny] == "O" && !visited.contains(nextPoint) {
                        queue.append(nextPoint)
                        surroundedQueue.append(nextPoint)
                        visited.insert(nextPoint)
                    }
                } else {
                    surroundedQueue.removeAll()
                    return false
                }
            }
        }
        
        return true
    }

    func removeSurroundedRegion(_ board: inout [[Character]], _ surroundedQueue: [Point]) {
        var queue = surroundedQueue
        while !queue.isEmpty {
            let currentPoint = queue.removeLast()
            board[currentPoint.x][currentPoint.y] = "X"
        }
    }
}