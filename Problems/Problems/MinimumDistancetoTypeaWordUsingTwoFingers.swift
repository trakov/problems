final class MinimumDistancetoTypeaWordUsingTwoFingers {
    func minimumDistance(_ word: String) -> Int {
        func dist(_ a: Int, _ b: Int) -> Int {
            abs(a / 6 - b / 6) + abs(a % 6 - b % 6)
        }
        var dp = Array(repeating: 0, count: 26)
        var (m, sum) = (0, 0)
        let word = Array(word)
        for i in 0..<word.count-1 {
            let p = Int(word[i].asciiValue!) - 65
            let c = Int(word[i + 1].asciiValue!) - 65
            let d = dist(p, c)
            sum += d
            var cur = 0
            for j in 0..<26 {
                cur = max(cur, dp[j] + d - dist(j, c))
            }
            dp[p] = max(dp[p], cur)
            m = max(m, dp[p])
        }
        return sum - m
    }

    func tests() {
        print(minimumDistance("CAKE")) // 3
        print(minimumDistance("HAPPY")) // 6
    }
}
