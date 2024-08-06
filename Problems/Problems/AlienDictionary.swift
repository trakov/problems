class AlienDictionary {
    func order(_ words: [String]) -> String {
        guard words.count > 1 else { return words.first ?? "" }
        var map: [Character: Set<Character>] = [:]
        var prev = words.first!
//        var allChars: Set<Character> = []
        for word in words.dropFirst() {
            if prev.count > word.count && prev.prefix(word.count) == word {
                return ""
            }
            for (c1, c2) in zip(prev, word) where c1 != c2 {
//                allChars.formUnion([c1, c2])
                map[c1, default: []].insert(c2)
                break
            }
            prev = word
        }
        
//        var all: [String] = []
        var result = ""
        var visit: [Character: Bool] = [:] // false - VISITED, true - in cur path
        func dfs(_ c: Character) -> Bool {
            if let vis = visit[c] { return vis }
            visit[c] = true
            for nei in map[c] ?? [] {
                if dfs(nei) { return true }
            }
            visit[c] = false
            result.append(c)
//            if result.count == allChars.count {
//                all.append(String(result.reversed()))
//            }
            return false
        }
        for c in map.keys {
            if dfs(c) {
                return ""
            }
        }
        
//        print(all)
        
        return String(result.reversed())
    }
    
    func tests() {
        print(order([
            "wrt",
            "wrf",
            "er",
            "ett",
            "rftt"
          ])) // wertf
        print(order([
            "z",
            "x"
          ])) // zx
        print(order([
            "ab",
            "ace",
            "fff"
          ])) // zx
        print(order([
            "z",
            "x",
            "z"
          ])) // ""
        print(order([
            "abc",
            "ab",
            "ab"
          ])) // ""
    }
}

