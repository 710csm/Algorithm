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
        let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        var visited: Set<Point> = []
        
        for i in 0..<m {
            for j in 0..<n {
                let currentPoint = Point(x: i, y: j)
                
                if board[i][j] == "O" && !visited.contains(currentPoint) {
                    var isSurrrounded: Bool = true
                    var queue: [Point] = [currentPoint]
                    var removeQueue: [Point] = [currentPoint]
                    visited.insert(currentPoint)
                    
                    while !queue.isEmpty {
                        let point = queue.removeFirst()
                        
                        for direction in directions {
                            let nx = point.x + direction.0
                            let ny = point.y + direction.1
                            
                            if nx >= 0, nx < m, ny >= 0, ny < n {
                                let nextPoint = Point(x: nx, y: ny)
                                if board[nx][ny] == "O" && !visited.contains(nextPoint) {
                                    queue.append(nextPoint)
                                    removeQueue.append(nextPoint)
                                    visited.insert(nextPoint)
                                }
                            } else {
                                isSurrrounded = false
                                removeQueue.removeAll()
                            }
                        }
                    }
                    
                    if isSurrrounded {
                        while !removeQueue.isEmpty {
                            let currentPoint = removeQueue.removeLast()
                            board[currentPoint.x][currentPoint.y] = "X"
                        }
                    }
                }
            }
        }
    }
}