import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var result: [Int] = [Int](repeating: -1, count: numbers.count)
    findBiggerNumber(numbers, result: &result)
    
    return result
}

func findBiggerNumber(_ numbers: [Int], result: inout [Int]) {
    var indexStack: [Int] = []
    
    for currentIndex in 0..<numbers.count {
        // 현재 숫자와 스택의 최상단 숫자를 비교
        while let lastIndex = indexStack.last, numbers[lastIndex] < numbers[currentIndex] {
            result[indexStack.removeLast()] = numbers[currentIndex]
        }
        // 현재 인덱스를 스택에 추가
        indexStack.append(currentIndex)
    }
}