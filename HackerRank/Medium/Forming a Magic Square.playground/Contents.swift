import UIKit

func formingMagicSquare(s: [[Int]]) -> Int {
    let magicSquares = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    ]

    var minimumCost = Int.max

    for magic in magicSquares {
        var cost = 0
        for i in 0..<3 {
            for j in 0..<3 {
                cost += abs(s[i][j] - magic[i][j])
            }
        }
        minimumCost = min(minimumCost, cost)
    }
    
    return minimumCost
}

/*
 a  b  c
 d  e  f
 g  h  i
 
 위의 행렬을 통해 8개의 식을 세울 수 있다
 
 a + b + c = 15
 d + e + f = 15
 g + h + i = 15
 a + d + g = 15
 b + e + h = 15
 c + f + i = 15
 a + e + i = 15
 c + e + g = 15
 
 숫자 5: 4번
 숫자 2,4,6,8: 3번
 숫자 1,3,7,9: 2번
 
 */
