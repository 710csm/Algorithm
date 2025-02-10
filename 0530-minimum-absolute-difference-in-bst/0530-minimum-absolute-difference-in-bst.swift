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
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var arr: [Int] = []
        
        searchTree(root: root, &arr)
        
        arr.sort()
        
        return arr[1] - arr[0]
    }

    func searchTree(root: TreeNode?, _ arr: inout [Int]) {
        guard let node = root else { return }
        arr.append(node.val)
        
        searchTree(root: node.left, &arr)
        searchTree(root: node.right, &arr)
    }
}