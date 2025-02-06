class Trie {
    
    class Node {
        var children: [Character: Node]
        var isEnd: Bool
        
        init() {
            self.children = [:]
            self.isEnd = false
        }
    }
    
    var root: Node

    init() {
        self.root = Node()
    }
    
    func insert(_ word: String) {
        var currentNode = self.root
        for key in word {
            if let nextNode = currentNode.children[key] {
                currentNode = nextNode
            } else {
                let newNode = Node()
                currentNode.children[key] = newNode
                currentNode = newNode
            }
        }
        
        currentNode.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = self.root
        for key in word {
            guard let nextNode = currentNode.children[key] else {
                return false
            }
            currentNode = nextNode
        }
        return currentNode.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = self.root
        for key in prefix {
            guard let nextNode = currentNode.children[key] else {
                return false
            }
            currentNode = nextNode
        }
        return true
    }
}
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */