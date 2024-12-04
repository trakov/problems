class MakeStringaSubsequenceUsingCyclicIncrements {
    func canMakeSubsequence(_ str1: String, _ str2: String) -> Bool {
        var j = 0
        let str1 = str1.map { $0.asciiValue! }
        let str2 = str2.map { $0.asciiValue! }
        let (n, m) = (str1.count, str2.count)
        for i in 0..<n {
            guard j < m else { break }
            if str1[i] == str2[j] || str1[i] + 1 == str2[j] || str1[i] - 25 == str2[j] {
                j += 1
            }
        }
        return j == m
    }
    
    func tests() {
        print(canMakeSubsequence("abc", "ad")) // true
        print(canMakeSubsequence("zc", "ad")) // true
        print(canMakeSubsequence("ab", "d")) // false
    }
}

