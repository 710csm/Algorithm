/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var rabbit: ListNode? = head
        var turtle: ListNode? = head
        
        while rabbit != nil && turtle?.next != nil {
            rabbit = rabbit?.next
            turtle = turtle?.next?.next
            
            if rabbit === turtle {
                return true
            }
        }
        
        return false
    }
}