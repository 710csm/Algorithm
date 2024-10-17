func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var result: [Int] = []
    
    for index in left...right {
        let i = Int(index / Int64(n))
        let j = Int(index % Int64(n))
        
        result.append(max(i+1, j+1))
    }
    
    return result
}
