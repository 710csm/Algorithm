class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var filterNums1: [Int] = []
        var filterNums2: [Int] = []
        
        for i in 0..<m {
            filterNums1.append(nums1[i])
        }
        
        for i in 0..<n {
            filterNums2.append(nums2[i])
        }
        
        let mergedArray = filterNums1 + filterNums2
        nums1 = mergedArray.sorted()
    }
}