import Foundation

let m = 6
var result: String = ""
var combi: [Int] = []
var visit: [Bool] = []
var arr: [Int] = []

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let k = input[0]
    if k == 0 { break }
    
    arr = Array(repeating: 0, count: k)
    combi = Array(repeating: 0, count: k)
    visit = Array(repeating: false, count: k)
    
    for i in 1...k {
        arr[i-1] = input[i]
    }
    
    backTracking(0, k, 0)
    result+="\n"
}


func backTracking(_ at: Int, _ k: Int, _ index: Int) {
    if index == m {
        for i in 0..<m {
            result+="\(combi[i])"
            result+=" "
        }
        result+="\n"
        return
    }

    for i in at..<k {
        if !visit[i] {
            visit[i] = true
            combi[index] = arr[i]
            backTracking(i, k, index+1)
            visit[i] = false
        }
    }
}

print(result)
