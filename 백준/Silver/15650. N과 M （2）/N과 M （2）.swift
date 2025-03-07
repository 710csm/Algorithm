import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var arr: [Int] = []
var combination: [Int] = Array(repeating: 0, count: m)

for i in 1...n {
    arr.append(i)
}

func backtracking(start: Int, count: Int) {
    if count == m {
        for number in combination {
            print(number, terminator: " ")
        }
        print()
        return
    }
    
    for i in start..<n {
        combination[count] = arr[i]
        backtracking(start: i + 1, count: count + 1)
    }
}

backtracking(start: 0, count: 0)
