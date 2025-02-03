class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
            if n == 1 { return 0 }

            var distances: [Int] = [Int](repeating: Int.max, count: n)
            distances[k-1] = 0

            for i in 0..<n-1 {
                var changed = false
                
                for j in 0..<times.count {
                    let source = times[j][0]
                    let target = times[j][1]
                    let weight = times[j][2]

                    guard distances[source-1] != Int.max else { continue }
                    
                    if distances[source-1] + weight < distances[target-1] {
                        distances[target-1] = distances[source-1] + weight
                        changed = true
                    }
                }

                if !changed { break }
            }
            
            let result = distances.max()!
            return result == Int.max ? -1 : result
    }
}