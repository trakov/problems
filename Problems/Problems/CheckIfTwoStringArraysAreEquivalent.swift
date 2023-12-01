class CheckIfTwoStringArraysAreEquivalent {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var i1 = 0
        var j1 = 0
        var i2 = 0
        var j2 = 0
        let word1 = word1.map { Array($0) }
        let word2 = word2.map { Array($0) }
        while i1 < word1.count && i2 < word2.count {
            guard word1[i1][j1] == word2[i2][j2] else {
                return false
            }
            j1 += 1; j2 += 1
            if j1 == word1[i1].count {
                i1 += 1; j1 = 0
            }
            if j2 == word2[i2].count {
                i2 += 1; j2 = 0
            }
        }
        return i1 == word1.count && i2 == word2.count
    }

    func arrayStringsAreEqual2(_ word1: [String], _ word2: [String]) -> Bool {
        return word1.joined() == word2.joined()
    }
    
    func tests() {
        print(arrayStringsAreEqual(["ab", "c"], ["a", "bc"])) // true
        print(arrayStringsAreEqual(["a", "cb"], ["ab", "c"])) // false
        print(arrayStringsAreEqual(["abc", "d", "defg"], ["abcddefg"])) // true
    }
}
