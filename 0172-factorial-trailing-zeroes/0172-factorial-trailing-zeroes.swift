class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        if(n < 5) { return 0 }

        var total = 0
        var cur = 5
        while(cur <= n) {
            total += n / cur
            cur *= 5
        }
        
        return total 
    }
}
