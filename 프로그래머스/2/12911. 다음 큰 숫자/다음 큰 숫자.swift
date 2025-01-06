import Foundation

func solution(_ n: Int) -> Int {
    let countOfOne = String(n, radix: 2).filter({ $0 == "1"}).count
    
    var answer: Int = 0
    var currentNumber = n + 1
    
    while true {
        let biggerNumber = String(currentNumber, radix: 2).filter({ $0 == "1"}).count
        
        if biggerNumber == countOfOne {
            answer = currentNumber
            break
        }
        
        currentNumber += 1
    }
    
    return answer
}