class DeleteOperationForTwoStrings {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard word1 != word2 else { return 0 }
        guard word1.count * word2.count != 0 else { return max(word1.count, word2.count) }
        var dp = Array(
            repeating: Array(repeating: 0, count: word2.count + 1),
            count: word1.count + 1
        )
        let word1 = Array(word1)
        let word2 = Array(word2)
        for i in 0..<word1.count {
            for j in 0..<word2.count {
                if word1[i] == word2[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }
        let lcsLen = dp[word1.count][word2.count]
        return word1.count - lcsLen + word2.count - lcsLen
    }

    func tests() {
        print(minDistance("sea", "eat")) // 2
        print(minDistance("leetcode", "etco")) // 4
    }
}
