func solution(_ s:String) -> [Int] {
    // 문자열을 Int형 배열로 변경 Ex) {{20,111},{111}} -> [20, 111, 111]
    let convertedArr = s
        .replacingOccurrences(of: "{", with: "")
        .replacingOccurrences(of: "}", with: "")
        .split(separator: ",")
        .map { Int($0)! }
    
    // 각 숫자의 출현 횟수를 딕셔너리에 저장
    var counts: [Int: Int] = [:]
    for number in convertedArr {
        counts[number, default: 0] += 1
    }
    
    // 출현 횟수에 따라 정렬하고, 결과 배열에 추가
    let result = counts.keys.sorted { counts[$0]! > counts[$1]! }
    
    return result
}