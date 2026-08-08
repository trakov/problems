final class FindtheLexicographicallySmallestValidSequence {
    func validSequence(_ word1: String, _ word2: String) -> [Int] {
        let (word2, m) = (Array(word2), word2.count)
        var last = Array(repeating: -1, count: m)
        var j = m - 1
        for (i, c) in word1.enumerated().reversed() {
            if j >= 0 && c == word2[j] {
                last[j] = i
                j -= 1
            }
        }
        var res = Array(repeating: 0, count: m)
        var skip = 0
        j = 0
        for (i, c) in word1.enumerated() {
            if j == m { break }
            if c == word2[j] || (skip == 0 && (j == m - 1 || i < last[j + 1])) {
                skip += c != word2[j] ? 1 : 0
                res[j] = i
                j += 1
            }
        }
        return j == m ? res : []
    }
    
    func tests() {
        print(validSequence("vbcca", "abc")) // [0,1,2]
        print(validSequence("bacdc", "abc")) // [1,2,4]
        print(validSequence("aaaaaa", "aaabc")) // []
        print(validSequence("abc", "ab")) // [0,1]
    }
}
