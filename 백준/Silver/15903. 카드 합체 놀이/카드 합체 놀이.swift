import Foundation

let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!

var cards: [Int] = []
var playCount: Int = 0

let inputCards = readLine()!.split(separator: " ")
for i in 0..<inputCards.count {
    cards.append(Int(inputCards[i])!)
}

while playCount != m {
    cards.sort()
    let sum = cards[0] + cards[1]
    cards[0] = sum
    cards[1] = sum
    
    playCount+=1
}

print(cards.reduce(0, +))
