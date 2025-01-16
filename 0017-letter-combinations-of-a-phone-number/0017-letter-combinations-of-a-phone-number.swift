class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        
        let numberMap: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        var result: [String] = []
        backtrack(numberMap, &result, "", digits)
        
        return result
    }

    func backtrack(
        _ numberMap: [Character: [String]], _ result: inout [String],
        _ combination: String, _ nextDigits: String
    ) {
        if nextDigits.isEmpty {
            result.append(combination)
        } else {
            for c in numberMap[nextDigits.first!]! {
                backtrack(
                    numberMap,
                    &result,
                    combination + String(c),
                    String(nextDigits.dropFirst())
                )
            }
        }
    }
}