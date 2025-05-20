/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    var visited: [Int: Node] = [:]
    
    func cloneGraph(_ node: Node?) -> Node? {
        return cloneGraphDFS(node)
    }
    
    func cloneGraphDFS(_ node: Node?) -> Node? {
        guard let node else { return nil }

        let newNode = Node(node.val)
        visited[node.val] = newNode
        
        for neighbor in node.neighbors {
            guard let neighbor else { continue }

            if let n = visited[neighbor.val] {
                newNode.neighbors.append(n)
            } else {
                let n = cloneGraphDFS(neighbor)
                newNode.neighbors.append(n)
            }
        }
        return newNode
    }
}