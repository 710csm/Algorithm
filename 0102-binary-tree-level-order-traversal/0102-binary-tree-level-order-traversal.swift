/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    var dic: [Int: [Int]] = [:]
    var result: [[Int]] = []
    var level: Int = 0
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if let root {
            dic[1] = [root.val]
            level = 1
            
            find(root: root, level: level + 1)
        } else {
            return []
        }
        
        
        for i in 1...level {
            result.append(dic[i]!)
        }
        
        return result
    }
    
    func find(root: TreeNode?, level: Int) {
        if let left = root?.left {
            var temp = dic[level, default: []]
            dic[level] = temp + [left.val]
            
            self.level = max(self.level, level)
            
            find(root: left, level: level + 1)
        }
        
        if let right = root?.right {
            var temp = dic[level, default: []]
            dic[level] = temp + [right.val]
            
            self.level = max(self.level, level)
            
            find(root: right, level: level + 1)
        }
    }
}