import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var workDay: [Int] = []
    var result: [Int] = []
    var distribute: Int = 0
    
    for index in 0..<progresses.count {
        // 100 - progress - speed * 작업일 -> 작업일 = (100 - progress) / speed
        // 올림을 해주기 위해 ceil을 사용하여 각 작업당 걸리는 시간을 계산한다
        // ex) [95, 90, 99, 99, 80, 99] -> [5, 10, 1, 1, 20, 1]
        let remain = ceil((100.0 - Double(progresses[index])) / Double(speeds[index]))
        workDay.append(Int(remain))
    }
    
    // 걸리는 작업일을 비교하여 현재 제일 오래걸리는 작업일보다 작으면 배포 작업의 개수를 +1 해준다
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
