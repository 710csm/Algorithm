import Foundation

func solution(_ record: [String]) -> [String] {
    var user: [String: String] = [:]
    var enterList: [[String: Bool]] = []
    var result: [String] = []
    
    for enter in record {
        let split = enter.components(separatedBy: " ")
        let uid = split[1]
        
        if split[0] == "Enter" {
            let name = split[2]
            user[uid] = name
            enterList.append([uid : true])
        } else if split[0] == "Leave" {
            enterList.append([uid : false])
        } else if split[0] == "Change" {
            let name = split[2]
            user[uid] = name
        }
    }
    
    for enter in enterList {
        for (uid, isEnter) in enter {
            if isEnter {
                result.append("\(user[uid]!)님이 들어왔습니다.")
            } else {
                result.append("\(user[uid]!)님이 나갔습니다.")
            }
        }
    }
    
    return result
}
