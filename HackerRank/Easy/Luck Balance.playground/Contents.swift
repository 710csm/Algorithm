import UIKit

func luckBalance(k: Int, contests: [[Int]]) -> Int {
    var result: Int = 0
    var k = k
    var importantContests: [[Int]] = []
    
    for contest in contests {
        if contest[1] == 0 {
            result += contest[0]
        } else {
            importantContests.append(contest)
        }
    }
    
    importantContests.sort { $0[0] > $1[0] }
    
    for contest in importantContests {
        if k > 0 {
            k -= 1
            result += contest[0]
        } else {
            result -= contest[0]
        }
    }
    
    return result
}
