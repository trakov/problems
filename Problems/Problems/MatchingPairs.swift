class MatchingPairs {
    func matchingPairs(_ s: String, _ t: String) -> Int {
        let n = s.count
        var k = 0
        var map: [Character: Set<Character>] = [:]
        for (c1, c2) in zip(s, t) {
            if c1 == c2 {
                k += 1
            } else {
                map[c1, default: []].insert(c2)
            }
        }
        
        if k >= n - 1 {
            var distincts: Set<Character> = []
            var isDist = true
            for c in s {
                if !distincts.insert(c).inserted {
                    isDist = false
                    break
                }
            }
            return isDist ? k - 2 : k
        }        
        return k
    }

    func tests() {
        print(matchingPairs("abcde", "adcbe")) // 5
        print(matchingPairs("abcd", "abcd")) // 2
    }
}
