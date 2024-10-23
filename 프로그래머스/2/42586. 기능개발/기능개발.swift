import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var workDay: [Int] = []
    var result: [Int] = []
    var distribute: Int = 0
    
    for index in 0..<progresses.count {
        let remain = ceil((100.0 - Double(progresses[index])) / Double(speeds[index]))
        workDay.append(Int(remain))
    }
    
    var maxDay = workDay.first!
    
    for day in workDay {
        if day > maxDay {
            if distribute > 0 {
                result.append(distribute)
            }
            distribute = 1
            maxDay = day
        } else {
            distribute += 1
        }
    }
    
    if distribute > 0 {
         result.append(distribute)
     }
    
    return result
}
