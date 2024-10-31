import Foundation

func solution(_ numbers:[Int], _ target: Int) -> Int {
    return dfs(numbers: numbers, target: target, index: 0, sum: 0)
}

func dfs(numbers: [Int], target: Int, index: Int, sum: Int) -> Int {
    if index == numbers.count {
        return sum == target ? 1 : 0
    }
    
    let add = dfs(
        numbers: numbers,
        target: target,
        index: index + 1,
        sum: sum + numbers[index]
    )
    
    let subtract = dfs(
        numbers: numbers,
        target: target,
        index: index + 1,
        sum: sum - numbers[index]
    )
    
    return add + subtract
}