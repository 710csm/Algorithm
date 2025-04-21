import Foundation

class GiftInfo {
    var name: String = ""
    var getGift: Int = 0
    var giveGift: Int = 0
    var giftValue: Int = 0
    var giveAndTake: [String] = []
    var nextGift: Int = 0
    
    init(name: String) {
        self.name = name
    }
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var infos: [GiftInfo] = []
    
    for friend in friends {
        var giftInfo = GiftInfo(name: friend)
        
        for gift in gifts {
            let giftArray = gift.components(separatedBy: " ")
            
            if giftArray[1] == friend {
                giftInfo.getGift += 1
                giftInfo.giveAndTake.append(giftArray[0])
            }
            
            if giftArray[0] == friend {
                giftInfo.giveGift += 1
            }
        }
        
        
        giftInfo.giftValue = giftInfo.giveGift - giftInfo.getGift
        infos.append(giftInfo)
    }
    
    for i in 0..<infos.count {
        for j in i..<infos.count {
            if infos[i].name == infos[j].name { continue }
            
            let friendGiveToMeCount = infos[i].giveAndTake.filter( { $0 == infos[j].name }).count
            let meGiveToFriendCount = infos[j].giveAndTake.filter( { $0 == infos[i].name }).count
            
            if friendGiveToMeCount > meGiveToFriendCount {
                infos[j].nextGift += 1
            } else if friendGiveToMeCount < meGiveToFriendCount {
                infos[i].nextGift += 1
            } else if friendGiveToMeCount == meGiveToFriendCount {
                if infos[i].giftValue > infos[j].giftValue {
                    infos[i].nextGift += 1
                } else if infos[i].giftValue < infos[j].giftValue {
                    infos[j].nextGift += 1
                } else {
                    continue
                }
            }
        }
    }
    
    return infos.map { $0.nextGift }.max() ?? 0
}