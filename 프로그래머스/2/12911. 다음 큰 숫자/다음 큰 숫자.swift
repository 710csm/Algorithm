import Foundation

func solution(_ n: Int) -> Int {
    var answer: Int = 0
    var currentNumber = n + 1
    
    while true {
        if n.nonzeroBitCount == currentNumber.nonzeroBitCount {
            answer = currentNumber
            break
        }
        
        currentNumber += 1
    }
    
    return answer
}