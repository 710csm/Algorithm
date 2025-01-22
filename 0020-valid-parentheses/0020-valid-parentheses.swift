class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        
        for c in s {
            if c == "(" || c == "{" || c == "[" {
                stack.append(c)
            } else if stack.isEmpty && (c == ")" || c == "}" || c == "]") {
                return false
            } else if !stack.isEmpty {
                if stack.last! == "(" && c == ")" {
                    stack.removeLast()
                } else if stack.last! == "{" && c == "}" {
                    stack.removeLast()
                } else if stack.last! == "[" && c == "]" {
                    stack.removeLast()
                }
            }
        }
        
        return stack.isEmpty ? true : false
    }
}