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
    var root1Leafs: [Int] = []
    var root2Leafs: [Int] = []
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        findLeafs(root1, &root1Leafs)
        findLeafs(root2, &root2Leafs)
        
        root1Leafs.forEach { print($0, terminator: " ") }
        root2Leafs.forEach { print($0, terminator: " ") }
        
        return root1Leafs == root2Leafs
    }

    func findLeafs(_ root: TreeNode?, _ arr: inout [Int]) {
        if let root {
            if root.left == nil && root.right == nil {
                arr.append(root.val)
                return
            }
            
            if let left = root.left {
                findLeafs(left, &arr)
            }
            
            if let right = root.right {
                findLeafs(right, &arr)
            }
        }
    }
}