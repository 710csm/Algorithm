import Foundation

func solution(_ s: String) -> [Int] {
    var task: Int = 0
    var totalZeroCount: Int = 0
    var s = s
    
    while s != "1" {
        totalZeroCount += s.filter({ $0 == "0"}).count
        task += 1
        
        let length = s.filter({ $0 == "1"}).count
        s = String(String(length, radix: 2))
    }
    
    return [task, totalZeroCount]
}