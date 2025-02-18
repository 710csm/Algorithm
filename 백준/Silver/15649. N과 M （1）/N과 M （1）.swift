import Foundation

let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!

var arr: [Int] = []
var combi = [Int](repeating: 0, count: m)
var visit = [Bool](repeating: false, count: n)

for num in 1...n {
    arr.append(num)
}

func combination(_ index: Int) {
    if index == m {
        for i in combi {
            print(i, terminator: " ")
        }
        print()
        return
    }
    
    for i in 0..<n {
        if visit[i] { continue }
        combi[index] = arr[i]
        visit[i] = true
        combination(index + 1)
        visit[i] = false
    }
}

combination(0)
