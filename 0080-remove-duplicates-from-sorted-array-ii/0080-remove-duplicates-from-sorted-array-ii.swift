class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result: [Int] = []
        var dict: [Int: Int] = [:]
        
        for num in nums {
            if let value = dict[num], value > 1 {
                continue
            }
            result.append(num)
            dict[num, default: 0] += 1
        }
        
        nums = result
        return nums.count
    }
}