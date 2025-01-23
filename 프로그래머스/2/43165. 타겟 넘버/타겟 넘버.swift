import Foundation

func solution(_ numbers:[Int], _ target: Int) -> Int {
    return dfs(numbers, 0, target, 0)
}

func dfs(_ numbers: [Int], _ index: Int, _ target: Int, _ sum: Int) -> Int{
    if index == numbers.count {
        return target == sum ? 1 : 0
    }
    
    return dfs(numbers, index+1, target, sum + numbers[index]) + dfs(numbers, index+1, target, sum - numbers[index])
}