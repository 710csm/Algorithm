import Foundation

func solution(_ clothes: [[String]]) -> Int {
    // 옷 종류별로 개수를 세는 딕셔너리
    var map = [String: Int]()
    
    // 옷 종류별로 개수 세기
    for clothe in clothes {
        map[clothe[1], default: 0] += 1
    }
    
    // 조합 계산
    let answer = map.values.reduce(1) { $0 * ($1 + 1) } - 1
    
    return answer
}