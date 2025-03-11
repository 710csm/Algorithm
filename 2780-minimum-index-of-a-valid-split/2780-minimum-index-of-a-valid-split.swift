class Solution {
    func minimumIndex(_ nums: [Int]) -> Int {
        var countMap: [Int: Int] = [:]
        var dominantElement: Int? = nil
        var dominantCount = 0
        var totalCount = nums.count
        
        // 전체 배열의 요소 수 세기
        for num in nums {
            countMap[num, default: 0] += 1
        }
        
        // 지배적인 요소 찾기
        for (key, value) in countMap {
            if value > dominantCount {
                dominantCount = value
                dominantElement = key
            }
        }
        
        // 배열을 나누기 위한 카운터
        var leftCount = 0
        var rightCount = totalCount
        
        // 지배적인 요소의 개수
        var leftDominantCount = 0
        var rightDominantCount = dominantCount
        
        // 배열을 순회하면서 분할 가능한 인덱스 찾기
        for i in 0..<nums.count {
            let currentNum = nums[i]
            
            // 왼쪽 배열 업데이트
            leftCount += 1
            if currentNum == dominantElement {
                leftDominantCount += 1
            }
            
            // 오른쪽 배열 업데이트
            rightCount -= 1
            if currentNum == dominantElement {
                rightDominantCount -= 1
            }
            
            // 지배적인 요소 조건 확인
            if leftCount < 2 * leftDominantCount && rightCount < 2 * rightDominantCount {
                return i
            }
        }
        
        return -1
    }
}