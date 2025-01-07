import Foundation

func solution(_ s:String) -> String {
    var result: String = ""
    
    let split = s.components(separatedBy: " ")
    for (index, word) in split.enumerated() {
        var newWord = word.lowercased()
        if let first = newWord.first, first.isLetter {
            let capitalizedFirstCharacter = String(first).uppercased()
            newWord.removeFirst()
            newWord = capitalizedFirstCharacter + newWord
        }
        result += index == 0 ? "\(newWord)" : " \(newWord)"
    }
    
    return result
}
