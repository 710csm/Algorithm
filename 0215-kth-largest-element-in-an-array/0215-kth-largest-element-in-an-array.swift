class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted(by: >)
        return sortedNums[k-1]
    }
}