class StoneGameII {
    func stoneGameII(_ piles: [Int]) -> Int {
        let n = piles.count
        var sums = Array(repeating: piles.last!, count: n)
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in stride(from: n-2, through: 0, by: -1) {
            sums[i] = sums[i+1] + piles[i]
        }
        func helper(_ i: Int, _ M: Int) -> Int {
            guard i < n else { return 0 }
            guard i + 2*M < n else { return sums[i] }
            guard dp[i][M] == 0 else { return dp[i][M] }
            var minPoints = Int.max
            for x in 1...2*M where i+x < piles.count {
                minPoints = min(minPoints, helper(i+x, max(M, x)))
            }
            dp[i][M] = sums[i] - minPoints
            return dp[i][M]
        }
        return helper(0, 1)
    }

    func tests() {
        print(stoneGameII([2,7,9,4,4])) // 10
        print(stoneGameII([1,2,3,4,5,100])) // 104
    }
}

