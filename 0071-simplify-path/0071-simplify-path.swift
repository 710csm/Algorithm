class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack: [String] = []
        var pathArr = path.split(separator: "/")
        
        for path in pathArr {
            if path == ".." {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else if path != "." {
                stack.append(String(path))
            }
        }
        
        return "/" + stack.joined(separator: "/")
    }
}