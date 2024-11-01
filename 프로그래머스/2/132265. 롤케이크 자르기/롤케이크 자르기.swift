import Foundation

func solution(_ topping: [Int]) -> Int {
    var result: Int = 0
    var arr1: [Int: Int] = [:]
    var arr2: [Int: Int] = [:]
    
    arr1[topping[0], default: 0] += 1
    for index in 1..<topping.count {
        arr2[topping[index], default: 0] += 1
    }
    
    // 두 배열의 키-값 쌍의 개수 비교
    for index in 1..<topping.count {
        let uniqueCount1 = arr1.count
        let uniqueCount2 = arr2.count
        
        if uniqueCount1 == uniqueCount2 {
            result += 1
        }
        
        let nextTopping = topping[index]
        arr1[nextTopping, default: 0] += 1
        
        arr2[nextTopping, default: 0] -= 1
        
        if arr2[nextTopping]! == 0 {
            arr2.removeValue(forKey: nextTopping)
        }
    }
    
    return result
}