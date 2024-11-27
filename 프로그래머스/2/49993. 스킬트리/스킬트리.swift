import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result: Int = 0
    
    for skill_tree in skill_trees {
        
        var isCurrect: Bool = true
        var index: Int = 0
        var skill = Array(skill)
        
        for s in skill_tree {
            guard let i = skill.firstIndex(of: s) else { continue }
            
            if index == i {
                index += 1
            } else if index < i {
                isCurrect = false
                break
            }
        }
        
        if isCurrect {
            result += 1
        }
    }
    
    return result
}
