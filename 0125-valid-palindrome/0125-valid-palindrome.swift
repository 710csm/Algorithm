class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let filterString = s.filter({ $0.isLetter || $0.isNumber })
        let lowercasedString = filterString.lowercased()
        
        if lowercasedString == String(lowercasedString.reversed()) {
            return true
        } else {
            return false
        }
    }
}