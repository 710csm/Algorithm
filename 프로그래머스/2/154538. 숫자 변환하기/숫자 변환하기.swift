import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    if x == y { return 0 }
    if x > y { return -1 }

    var count: Int = 0
    var visited: Set<Int> = [x]
    var x = x
    
    while true {
        var temp: Set<Int> = []
        
        if visited.contains(y) {
            return count
        }
        
        for currentX in visited {
            [currentX + n, currentX * 2, currentX * 3].forEach {
                if $0 <= y {
                    temp.insert($0)
                }
            }
            
        }
        
        if temp.isEmpty {
            return -1
        } else {
            count += 1
            visited = temp
        }
    }

    return -1
}