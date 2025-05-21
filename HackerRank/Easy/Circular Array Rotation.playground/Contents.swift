import UIKit

func circularArrayRotation(a: [Int], k: Int, queries: [Int]) -> [Int] {
    var result: [Int] = []
    var a = a
    
    for i in 0..<k {
        let lastElement = a.removeLast()
        a.insert(lastElement, at: 0)
    }
    
    for query in queries {
        result.append(a[query])
    }
    
    return result
}

circularArrayRotation(a: [1,2,3], k: 2, queries: [0,1,2])
