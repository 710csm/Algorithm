class Solution {
    class Point {
        let x: Int
        let y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count <= 0 { return 0 }

        var result: Int = 0
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count), count: grid.count)
        
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "0" { continue }
                
                if grid[i][j] == "1" && !visited[i][j] {
                    findIsland(grid, i, j, &visited)
                    result += 1
                }
            }
        }
        
        return result
    }

    func findIsland(_ grid: [[Character]], _ i: Int, _ j: Int, _ visited: inout [[Bool]]) {
        var queue: [Point] = [Point(i, j)]
        visited[i][j] = true
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let x = current.x
            let y = current.y
            
            // 4방향 탐색
            let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
            
            for (dx, dy) in directions {
                let newX = x + dx
                let newY = y + dy
                
                if newX >= 0 && newX < grid.count && newY >= 0 && newY < grid[0].count {
                    if grid[newX][newY] == "1" && !visited[newX][newY] {
                        queue.append(Point(newX, newY))
                        visited[newX][newY] = true // 방문 처리
                    }
                }
            }
        }
    }
}