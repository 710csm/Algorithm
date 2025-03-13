extension String {
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

class Solution {
    func printVertically(_ s: String) -> [String] {
        let wordArr = s.split(separator: " ")
        let maxLength = wordArr.map(\.count).max()!
        var result: [String] = Array(repeating: "", count: maxLength)
        
        for i in 0..<maxLength {
            for j in 0..<wordArr.count {
                if i >= String(wordArr[j]).count {
                    result[i]+=" "
                } else {
                    let current = String(wordArr[j])[i]
                    result[i]+=String(current)
                }
            }
        }
        
        for i in 0..<result.count {
            while result[i].last == " " {
                result[i].removeLast()
            }
        }

        return result
    }
}