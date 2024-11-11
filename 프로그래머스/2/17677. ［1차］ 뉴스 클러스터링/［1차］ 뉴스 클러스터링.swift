import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = str1.lowercased()
    var str2 = str2.lowercased()
    
    // str1과 str2의 다중집합을 저장할 리스트 생성
    var list1: [String] = []
    var list2: [String] = []
    multipleSets(list: &list1, str: str1)
    multipleSets(list: &list2, str: str2)
    
    // 교집합과 합집합 크기를 저장할 변수 선언 (소수점 계산을 위해 double 타입 사용)
    var union: Double = 0
    var intersection: Double = 0
    
    // 자카드 유사도 계산
    if list1.count == 0 && list2.count == 0 {
        return 65536
    }
    
    // list1의 각 요소에 대해 처리
    for i in 0..<list1.count {
        var str = list1[i]
        
        // 교집합 계산: list2에 해당 요소가 있으면 교집합 크기 증가
        if list2.contains(str) {
            intersection += 1
            list2.remove(at: list2.firstIndex(of: str)!)
        }
        // 합집합 크기 증가
        union += 1
    }
    
    // list2의 남은 원소의 크기를 더해준다
    union += Double(list2.count)
    
    return Int(intersection / (union) * 65536.0)
}

func multipleSets(list: inout [String], str: String) {
    for i in 0..<str.count - 1 {
        let startIndex = str.index(str.startIndex, offsetBy: i)
        let endIndex = str.index(after: startIndex)
        let substring = String(str[startIndex...endIndex])
            .replacingOccurrences(
                of: "[^a-zA-Z]",
                with: "",
                options: .regularExpression
            )
        
        if substring.count == 2 {
            list.append(substring)
        }
    }
}
