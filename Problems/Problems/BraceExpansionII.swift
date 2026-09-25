final class BraceExpansionII {
    func braceExpansionII(_ expression: String) -> [String] {
        var stack: [Set<String>] = [[""]]
        for c in expression {
            if c == "," {
                stack.append(stack.removeLast().union(stack.removeLast()))
                stack.append([""])
            } else if c == "}" {
                let merged = stack.removeLast().union(stack.removeLast())
                let result = Set(stack.removeLast().flatMap { l in
                    merged.map { r in l + r }
                })
                stack.append(result)
            } else if c == "{" {
                stack.append(contentsOf: [[], [""]])
            } else {
                stack[stack.count - 1] = Set(stack[stack.count - 1].map { $0 + String(c) })
            }
        }
        return stack.removeLast().sorted()
    }
    
    func tests() {
        print(braceExpansionII("{a,b}{c,{d,e}}")) // ["ac","ad","ae","bc","bd","be"]
        print(braceExpansionII("{{a,z},a{b,c},{ab,z}}")) // ["a","ab","ac","z"]
    }
}
