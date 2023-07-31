class SimplifyPath {
    func simplifyPath(_ path: String) -> String {
        var stack: [Substring] = []
        for p in path.split(separator: "/") {
            if p == ".." {
                stack.popLast()
            } else if p != "." {
                stack.append(p)
            }
        }
        return "/" + stack.joined(separator: "/")
    }
    
    func tests() {
        print(simplifyPath("/home/")) // "/home"
        print(simplifyPath("/../")) // "/"
        print(simplifyPath("/home//foo/")) // "/home/foo"
        print(simplifyPath("/a/./b/../../c/")) // "/c"
        print(simplifyPath("/a/../../b/../c//.//")) // "/c"
        print(simplifyPath("/a//b////c/d//././/..")) // "/a/b/c"
    }
}

