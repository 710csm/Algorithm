import Foundation

func solution(_ msg: String) -> [Int] {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var dict: [String: Int] = [:]
    var result: [Int] = []
    var msg = Array(msg)
    
    
    // 사전 초기화
    for (index, c) in alphabet.enumerated() {
        dict[String(c)] = index + 1
    }
    
    var index = 0
    
    while index < msg.count {
        var word = String(msg[index])
        var nextIndex = index + 1
        
        // 가능한 최대 단어를 찾기
        while nextIndex < msg.count && dict.keys.contains(word + String(msg[nextIndex])) {
            word += String(msg[nextIndex])
            nextIndex += 1
        }
        
        // 결과에 단어의 인덱스를 추가
        result.append(dict[word]!)
        
        // 새로운 단어 추가
        if nextIndex < msg.count {
            let newWord = word + String(msg[nextIndex])
            if dict[newWord] == nil {
                dict[newWord] = dict.count + 1
            }
        }
        
        // 인덱스를 다음 단어로 이동
        index = nextIndex
    }
    
    return result
}
