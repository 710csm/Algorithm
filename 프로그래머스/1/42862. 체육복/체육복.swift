import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var result: Int = n - lost.count
    var reserve = reserve.sorted()
    var lost = lost.sorted()
    
    // 1. 여벌의 체육복이 있는데 도난당한 학생의 경우
    for i in 0..<lost.count {
        for j in 0..<reserve.count {
            if lost[i] == reserve[j] {
                result+=1
                reserve[j] = -1
                lost[i] = -1
                break
            }
        }
    }
    
    // 2. 여벌의 체육복이 있고 도난당하지 않아 빌려줄 수 있는 학생의 경우
    for i in 0..<lost.count {
        for j in 0..<reserve.count {
            if reserve[j] == lost[i] - 1 || reserve[j] == lost[i] + 1 {
                result+=1
                reserve[j] = -1
                lost[i] = -1
                break
            }
        }
    }
    
    return result
}