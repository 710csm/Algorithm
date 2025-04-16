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
    var dic: [Int: Int] = [:]

    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        dic[1] = root.val
        
        findRightSide(root, 2)
        
        var result: [Int] = []
        for i in 1...dic.keys.count {
            result.append(dic[i]!)
        }
        
        return result
    }
    
    func findRightSide(_ root: TreeNode?, _ depth: Int) {
        if let root {
            if let left = root.left {
                dic[depth] = left.val
                findRightSide(left, depth + 1)
            }
            
            if let right = root.right {
                dic[depth] = right.val
                findRightSide(right, depth + 1)
            }
        }
    }
}