class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let magazineArr = Array(magazine)
        var ransomNoteArr = Array(ransomNote)
        
        for c in magazineArr {
            if ransomNoteArr.contains(c) {
                ransomNoteArr.remove(at: ransomNoteArr.firstIndex(of: c)!)
            }
        }
        
        print(ransomNote)
        return ransomNoteArr.isEmpty
    }
}