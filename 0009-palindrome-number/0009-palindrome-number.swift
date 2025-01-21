class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        
        let numberArray = String(x).compactMap { Int(String($0)) }
        print(numberArray)
        var result: Bool = true
        var i: Int = 0
        var j: Int = numberArray.count - 1
        
        while i != j {
            if numberArray[i] != numberArray[j] {
                result = false
                break
            }
            i += 1
            j -= 1
            
            if i > numberArray.count / 2 {
                break
            }
        }
        
        return result
    }
}