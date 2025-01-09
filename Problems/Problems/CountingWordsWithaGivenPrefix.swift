class CountingWordsWithaGivenPrefix {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        words.reduce(0) { $0 + ($1.hasPrefix(pref) ? 1 : 0) }
    }
    
    func tests() {
        print(prefixCount(["pay","attention","practice","attend"], "at")) // 2
        print(prefixCount(["leetcode","win","loops","success"], "code")) // 0
    }
}

