import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]](
        repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count
    )
    
    for i in 0..<result.count {
        for j in 0..<result[i].count {
            for k in 0..<arr1[0].count {
                result[i][j] += arr1[i][k] * arr2[k][j]
            }
        }
    }
    
    return result
}