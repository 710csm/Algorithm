import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var combination: [Int] = Array(repeating: 0, count: m)
var result: String = ""

func backtracking(depth: Int) {
    if depth == m {
        for number in combination {
            result+="\(number) "
        }
        result+="\n"
        return
    }
    
    for i in 1...n {
        combination[depth] = i
        backtracking(depth: depth + 1)
    }
}

backtracking(depth: 0)
print(result)
