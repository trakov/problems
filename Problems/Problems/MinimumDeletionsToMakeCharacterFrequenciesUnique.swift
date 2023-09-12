class MinimumDeletionsToMakeCharacterFrequenciesUnique {
    func minDeletions(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var result = 0
        var set: Set<Int> = []
        let dict = s.reduce(into: [Character: Int]()) {
            $0[$1, default: 0] += 1
        }
        for (_, count) in dict {
            var newCount = count
            while set.contains(newCount) {
                newCount -= 1
                result += 1
            }
            if newCount > 0 {
                set.insert(newCount)
            }
        }
        return result
    }
    
    func tests() {
        print(minDeletions("aab")) // 0
        print(minDeletions("aaabbbcc")) // 2
        print(minDeletions("ceabaacb")) // 2
    }
}

