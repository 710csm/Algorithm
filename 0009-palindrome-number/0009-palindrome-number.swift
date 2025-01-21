class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        
        let numberArray = String(x).compactMap { Int(String($0)) }
        print(numberArray)
        var result: Bool = true
        var left: Int = 0
        var right: Int = numberArray.count - 1
        
        while left != right {
            if numberArray[left] != numberArray[right] {
                result = false
                break
            }
            left += 1
            right -= 1
            
            if left > numberArray.count / 2 {
                break
            }
        }
        
        return result
    }
}