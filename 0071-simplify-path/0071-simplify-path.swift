class Solution {
    func simplifyPath(_ path: String) -> String {
        var result: String = ""
        var stack: [String] = []
        var pathArr = path.split(separator: "/")
        
        if pathArr.count == 0 { return "/" }
        
        for (index, path) in pathArr.enumerated() {
            if stack.isEmpty {
                stack.append("/")
            }
            
            if path == ".." {
                if stack.count > 1 {
                    stack.removeLast()
                }
                
                while stack.last != "/" && !stack.isEmpty {
                    stack.removeLast()
                }
            } else if path == "." && stack.last == "/" {
                continue
            } else {
                stack.append(String(path))
            }
            
            if !stack.isEmpty && stack.last != "/" {
                stack.append("/")
            }

        }
        
        if stack.last == "/" && stack.count != 1 {
            stack.removeLast()
        }
        
        if stack.isEmpty { stack.append("/") }
        
        for path in stack {
            result += path
        }
        
        return result
    }
}