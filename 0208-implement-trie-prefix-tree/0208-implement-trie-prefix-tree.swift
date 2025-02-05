
class Trie {
    
    private var wordList: Set<String>

    init() {
        self.wordList = []
    }
    
    func insert(_ word: String) {
        wordList.insert(word)
    }
    
    func search(_ word: String) -> Bool {
        wordList.contains(word)
    }
    
    func startsWith(_ prefix: String) -> Bool {
        wordList.filter({ $0.hasPrefix(prefix) }).count > 0
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */