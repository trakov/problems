class CheckIfTwoStringArraysAreEquivalent {
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        return word1.joined() == word2.joined()
    }
    
    func tests() {
        print(arrayStringsAreEqual(["ab", "c"], ["a", "bc"]))
        print(arrayStringsAreEqual(["a", "cb"], ["ab", "c"]))
        print(arrayStringsAreEqual(["abc", "d", "defg"], ["abcddefg"]))
    }
}
