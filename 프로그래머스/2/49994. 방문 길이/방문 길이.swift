import Foundation

struct Point: Hashable {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    static func == (lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct Path: Hashable {
    var current: Point
    var next: Point

    init(current: Point, next: Point) {
        if (current.x < next.x) || (current.x == next.x && current.y < next.y) {
            self.current = current
            self.next = next
        } else {
            self.current = next
            self.next = current
        }
    }

    static func == (lhs: Path, rhs: Path) -> Bool {
        lhs.current == rhs.current && lhs.next == rhs.next
    }
}

func solution(_ dirs:String) -> Int {
    var visit: Set<Path> = []
    var result: Int = 0
    var currentPoint: Point = Point(x: 0, y: 0)
    
    for dir in dirs {
        var nextPoint = currentPoint
        
        switch dir {
        case "U":
            nextPoint.y += 1
            if nextPoint.y > 5 {
                nextPoint.y -= 1
                continue
            }
        case "D":
            nextPoint.y -= 1
            if nextPoint.y < -5 {
                nextPoint.y += 1
                continue
            }
        case "L":
            nextPoint.x -= 1
            if nextPoint.x < -5 {
                nextPoint.x += 1
                continue
            }
        case "R":
            nextPoint.x += 1
            if nextPoint.x > 5 {
                nextPoint.x -= 1
                continue
            }
        default:
            continue
        }
        
        let path = Path(current: currentPoint, next: nextPoint)
        if !visit.contains(path) {
            visit.insert(path)
            result += 1
        }
        
        currentPoint = nextPoint
    }
    
    return result
}
