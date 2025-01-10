class WordSubsets {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        var map: [Character: Int] = [:]
        for word in words2 {
            var wMap: [Character: Int] = [:]
            for c in word {
                wMap[c, default: 0] += 1
            }
            for (c, count) in wMap {
                map[c] = max(map[c] ?? 0, count)
            }
        }
        return words1.filter { word in
            var wMap: [Character: Int] = [:]
            for c in word {
                wMap[c, default: 0] += 1
            }
            for (c, count) in map where (wMap[c] ?? 0) < count {
                return false
            }
            return true
        }
    }
    
    func tests() {
        print(wordSubsets(["amazon","apple","facebook","google","leetcode"], ["e","o"]))
        // ["facebook","google","leetcode"]
        print(wordSubsets(["amazon","apple","facebook","google","leetcode"], ["l","e"]))
        // ["apple","google","leetcode"]
    }
}

