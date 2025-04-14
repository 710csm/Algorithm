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
    var result: Int = 1
    
    func goodNodes(_ root: TreeNode?) -> Int {
        findGoodNode(root)
        return result
    }

    func findGoodNode(_ root: TreeNode?) {
        if let root {
            if let left = root.left {
                if root.val <= left.val {
                    result += 1
                }
                
                findGoodNode(left)
            }
            
            if let right = root.right {
                if root.val <= right.val {
                    result += 1
                }
                
                findGoodNode(right)
            }
        }
    }
}