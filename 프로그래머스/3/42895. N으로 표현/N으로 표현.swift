import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var result: Int = -1
    
    if N == number {
        return 1
    }
    
    func dfs(_ count: Int, _ now: Int) {
        var NN: Int = 0
        
        if count > 8 {
            return
        }
        
        if now == number {
            if count < result || result == -1 {
                result = count
            }
            return
        }
        
        for i in 0..<8 {
            if result != -1 && result < count + 1 + i {
                break
            }
            NN = NN * 10 + N
            
            dfs(count + 1 + i, now + NN)
            dfs(count + 1 + i, now - NN)
            dfs(count + 1 + i, now * NN)
            dfs(count + 1 + i, now / NN)
        }
    }
    
    dfs(0, 0)
    
    return result
}
