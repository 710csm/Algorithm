import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    // 제거한 블록 수
    var result: Int = 0
    // String 1차원 배열을 Character 2차원 배열로 복사
    var characterBoard = board.map{ Array($0) }
    characterBoard.reverse()
    
    while true {
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        // 블록을 제거, 지울 블록이 없으면 게임 끝
        if removeBlock(&result, &characterBoard, &visited) { break }
        
        // 블록 이동하기
        moveBlock(&characterBoard, &visited)
    }
    
    return result
}

func removeBlock(
    _ result: inout Int,
    _ characterBoard: inout [[Character]],
    _ visited: inout [[Bool]]
) -> Bool {
    var isEndGame: Bool = true
    
    for i in 0..<characterBoard.count - 1 {
        for j in 0..<characterBoard[i].count - 1 {
            // 현재 블록 포함 2X2
            let current = characterBoard[i][j]
            let up = characterBoard[i+1][j]
            let right = characterBoard[i][j+1]
            let upRight = characterBoard[i+1][j+1]
            
            // 현재 블록이 지워지지 않았고, 주변 블록이 같으면 블록을 제거, 블록을 제거 했다면 게임이 끝나지 않음
            // 방문 기록을 true로 바꾸고 제거한 블록 수를 증가
            if current != "x", current == up, current == right, current == upRight {
                if !visited[i][j] {
                    result += 1
                    visited[i][j] = true
                }
                
                if !visited[i+1][j] {
                    result += 1
                    visited[i+1][j] = true
                }
                
                if !visited[i][j+1] {
                    result += 1
                    visited[i][j+1] = true
                }
                
                if !visited[i+1][j+1] {
                    result += 1
                    visited[i+1][j+1] = true
                }
                
                isEndGame = false
            }
        }
    }
    return isEndGame
}

func moveBlock(_ characterBoard: inout [[Character]], _ visited: inout [[Bool]]) {
    for i in 0..<characterBoard.count - 1 {
        for j in 0..<characterBoard[i].count {
            // 방문했던 블록이면 제거
            if visited[i][j] {
                characterBoard[i][j] = "x"
                // 위에 있는 블록들의 방문 여부와 이미 지워진 블록인지 판단하여 블록들을 아래로 이동
                for k in i+1..<characterBoard.count {
                    if characterBoard[k][j] != "x" && !visited[k][j] {
                        characterBoard[i][j] = characterBoard[k][j]
                        characterBoard[k][j] = "x"
                        visited[k][j] = true
                        break
                    }
                }
            }
        }
    }
}