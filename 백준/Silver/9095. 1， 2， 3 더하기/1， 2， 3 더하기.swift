var dp: [Int] = Array(repeating: 0, count: 20)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4..<11 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}