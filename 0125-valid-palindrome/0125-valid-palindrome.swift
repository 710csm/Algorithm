class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let filterString = s.filter({ $0.isLetter || $0.isNumber }).lowercased()
        
        if filterString == String(filterString.reversed()) {
            return true
        } else {
            return false
        }
    }
}