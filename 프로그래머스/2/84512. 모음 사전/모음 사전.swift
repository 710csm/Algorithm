import Foundation

func solution(_ word: String) -> Int {
    let words = ["A", "E", "I", "O", "U"]
    var dictionary: [String] = []
    var result: Int = 0
    
    dfs(words: words, current: "", dictionary: &dictionary)
    
    result = dictionary.firstIndex(of: word)!

    return result
}

func dfs(words: [String], current: String, dictionary: inout [String]) {
    if current.count > 5 {
        return
    }
    
    dictionary.append(current)
    
    for w in words {
        dfs(words: words, current: current + w, dictionary: &dictionary)
    }
}
