extension String {
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

class Solution {
    class Gene {
        let gene: String
        let count: Int
        
        init(_ gene: String, _ count: Int) {
            self.gene = gene
            self.count = count
        }
    }

    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        if bank.isEmpty { return -1 }
        
        var result: Int = -1
        var visited: [Bool] = [Bool](repeating: false, count: bank.count)
        var queue: [Gene] = []
        queue.append(Gene(startGene, 0))
        
        while !queue.isEmpty {
            let currrent = queue.removeFirst()
            
            if currrent.gene == endGene {
                result = currrent.count
                break
            }
            
            for i in 0..<bank.count {
                var diffCount: Int = 0
                let gene = bank[i]
                
                for (index, c) in currrent.gene.enumerated() {
                    if c != gene[index] {
                        diffCount+=1
                    }
                }
                
                if diffCount == 1 && !visited[i] {
                    visited[i] = true
                    queue.append(Gene(gene, currrent.count + 1))
                }
            }
        }
        
        return result
    }
}