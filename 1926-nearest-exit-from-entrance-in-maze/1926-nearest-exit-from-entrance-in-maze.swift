class Solution {
    struct Point: Hashable {
        let x: Int
        let y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let m = maze.count
        let n = maze[0].count
        let directions: [(Int, Int)] = [(0,1),(0,-1),(1,0),(-1,0)]
        
        var steps = 0
        var queue = [Point(entrance[0], entrance[1])]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        visited[entrance[0]][entrance[1]] = true
        
        func isExit(_ p: Point) -> Bool {
            return (p.x == 0 || p.x == m - 1) || (p.y == 0 || p.y == n - 1)
        }
        
        while !queue.isEmpty {
            steps += 1
            var newQueue: [Point] = []
            for point in queue {
                for (dx,dy) in directions {
                    let next = Point(point.x + dx, point.y + dy)
                    if (next.x < 0 || next.x > m - 1) ||
                        (next.y < 0 || next.y > n - 1) ||
                        maze[next.x][next.y] != "." ||
                        visited[next.x][next.y]
                    {
                        continue
                    }
                    visited[next.x][next.y] = true
                    
                    let np = Point(next.x, next.y)
                    
                    if isExit(np) {
                        return steps
                    } else {
                        newQueue.append(np)
                    }
                }
            }
            queue = newQueue
        }
        return -1
    }
}