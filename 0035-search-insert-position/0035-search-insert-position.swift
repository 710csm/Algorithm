class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if target < nums[0] {
            return 0
        } else if target > nums[nums.count-1] {
            return nums.count
        }
        
        return binarySearch(nums: nums, low: 0, high: nums.count-1, target: target)
    }

    func binarySearch(nums: [Int], low: Int, high: Int, target: Int) -> Int {
        var low = low
        var high = high
        
        while low <= high {
            let mid = (low + high) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        
        return low
    }
}