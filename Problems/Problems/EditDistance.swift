class EditDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let s1 = Array(word1)
        let s2 = Array(word2)
        let count1 = s1.count
        let count2 = s2.count
        guard count1 * count2 != 0 else { return max(count1, count2) }
        var dp = Array(0...count2)
        for i in 1...count1 {
            var newDP = dp
            newDP[0] = i
            for j in 1...count2 {
                let k = s1[i - 1] == s2[j - 1] ? 1 : 0
                newDP[j] = 1 + min(
                    dp[j],
                    newDP[j-1],
                    dp[j-1] - k
                )
            }
            dp = newDP
        }
        return dp.last!
    }

    func tests() {
        print(minDistance("horse", "horseq")) // 1
        print(minDistance("horse", "ros")) // 3
        print(minDistance("intention", "execution")) // 5
    }
}
