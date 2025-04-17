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
    var result: TreeNode?
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        
        result = chageTree(root)
        
        return result
    }
    
    func chageTree(_ root: TreeNode?) -> TreeNode? {
        var root = root
        if let root {
            var temp: TreeNode?
            
            temp = root.left
            
            root.left = root.right
            root.left = chageTree(root.left)
            
            root.right = temp
            root.right = chageTree(root.right)
            
            return root
        } else {
            return nil
        }
    }
}
