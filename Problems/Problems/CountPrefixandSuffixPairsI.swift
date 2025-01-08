class CountPrefixandSuffixPairsI {
    func countPrefixSuffixPairs(_ words: [String]) -> Int {
        guard words.count > 1 else { return 0 }
        func isPrefixAndSuffix(_ w1: String, _ w2: String) -> Bool {
            w2.hasPrefix(w1) && w2.hasSuffix(w1)
        }
        var result = 0
        for (i, w1) in words.enumerated().dropLast() {
            for w2 in words.dropFirst(i + 1) {
                result += isPrefixAndSuffix(w1, w2) ? 1 : 0
            }
        }
        return result
    }
    
    func tests() {
        print(countPrefixSuffixPairs(["a","aba","ababa","aa"])) // 4
        print(countPrefixSuffixPairs(["pa","papa","ma","mama"])) // 2
        print(countPrefixSuffixPairs(["abab","ab"])) // 0
    }
}

