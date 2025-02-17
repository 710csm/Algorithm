class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var arr:[Int] = []
        
        for i in 1...n {
            arr.append(i)
        }
        
        var data = [Int](repeating: 0, count: k)
        combination(arr: arr, data: &data, start: 0, end: n - 1, index: 0, k: k, result: &result)
        
        return result
    }

    func combination(arr: [Int], data: inout [Int], start: Int, end: Int, index: Int, k: Int, result: inout [[Int]]) {
        if index == k {
            result.append(data)
            return
        }

        for i in start...end where end - i + 1 >= k - index {
            data[index] = arr[i]
            combination(arr: arr, data: &data, start: i + 1, end: end, index: index + 1, k: k, result: &result)
        }
    }
}