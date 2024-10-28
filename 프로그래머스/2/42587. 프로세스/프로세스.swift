import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorityList = priorities
    var index = [Int]()
    var result: Int = 0
    
    for i in 0..<priorityList.count {
        index.append(i)
    }
    
    while(true) {
        // 큐에서 우선순위가 제일 높은 프로세스일 때
        if priorityList[0] == priorityList.max() {
            // 몇 번째로 실행되는지 알고싶은 프로세스의 위치와 현재 프로세스가 일치할 경우
            if location == index[0] {
                result += 1
                return result
            // 몇 번째로 실행되는지 알고싶은 프로세스의 위치와 현재 프로세스가 다를 경우
            // 작업을 끝내고 큐와 인덱스를 정리
            } else {
                result += 1
                priorityList.removeFirst()
                index.removeFirst()
            }
        // 큐에서 우선순위가 제일 높은 프로세스가 아닐 때 큐의 맨 뒤로 다시 보낸다
        } else {
            priorityList.append(priorityList.removeFirst())
            index.append(index.removeFirst())
        }
    }
}