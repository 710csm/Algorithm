class Solution {

    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        for i in 0..<nums.count {
            var leftIndex = 0
            var rightIndex = leftIndex + i
            
            while rightIndex != nums.count {
                var sum = 0
                for j in leftIndex...rightIndex {
                    sum += nums[j]
                    
                    if target <= sum {
                        return i+1
                    }
                }
                
                leftIndex+=1
                rightIndex+=1
            }
        }
        
        return 0
    }

}