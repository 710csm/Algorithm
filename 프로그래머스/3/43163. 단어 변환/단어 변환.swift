import Foundation

class Word {
    var word: String
    var count: Int

    init(_ word: String, _ count: Int) {
        self.word = word
        self.count = count
    }
}

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var result: Int = 0
    var visited: [Bool] = [Bool](repeating: false, count: words.count)
    var queue: [Word] = []
    queue.append(Word(begin, 0))
    
    while !queue.isEmpty {
        let currrent = queue.removeFirst()
        
        if currrent.word == target {
            result = currrent.count
            break
        }
        
        for i in 0..<words.count {
            var count: Int = 0
            let word = words[i]
            
            for (index, c) in currrent.word.enumerated() {
                if c != word[word.index(word.startIndex, offsetBy: index)] {
                    count+=1
                }
            }
            
            if count == 1 && !visited[i] {
                visited[i] = true
                queue.append(Word(word, currrent.count + 1))
            }
        }
    }
    
    return result
}