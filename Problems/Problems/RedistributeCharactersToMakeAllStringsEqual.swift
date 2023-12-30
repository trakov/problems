class RedistributeCharactersToMakeAllStringsEqual {
    func makeEqual(_ words: [String]) -> Bool {
        guard words.count > 1 else { return true }
        let n = words.count
        var map: [Character: Int] = [:]
        for word in words {
            for c in word {
                map[c, default: 0] += 1
            }
        }
        for (_, count) in map {
            guard count % n == 0 else { return false }
        }
        return true
    }
    
    func tests() {
        print(makeEqual(["abc","aabc","bc"])) // true
        print(makeEqual(["ab","a"])) // false
    }
}

