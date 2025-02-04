import Foundation

extension String {
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

extension Character {
    func toAsciiValue() -> Int {
        Int(self.asciiValue!)
    }
}

func solution(_ name: String) -> Int {
    if name == "AAA" { return 0 }
    
    var result: Int = 0
    var length = name.count
    
    var index: Int = 0
    var move = length - 1
    
    for i in 0..<length {
        result += min(
            name[i].toAsciiValue() - Character("A").toAsciiValue(),
            Character("Z").toAsciiValue() - name[i].toAsciiValue() + 1
        )
        
        index = i + 1
        while index < length && name[index] == "A" {
            index += 1
        }
        
        move = min(move, i * 2 + length - index)
        move = min(move, (length - index) * 2 + i)
    }
    
    return result + move
}
