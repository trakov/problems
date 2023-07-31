class MaximumValueOfKCoinsFromPiles {
    func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
        var dp = Array(repeating: 0, count: k + 1)
        for pile in piles {
            for j in (0...k).reversed() {
                var maxSum = 0
                var sum = 0
                for i in 0...min(pile.count, j) {
                    if i > 0 {
                        sum += pile[i - 1]
                    }
                    maxSum = max(maxSum, dp[j-i] + sum)
                }
                dp[j] = maxSum
            }
        }
        return dp[k]
    }

    func maxValueOfCoins2(_ piles: [[Int]], _ k: Int) -> Int {
        piles.indices
        .reduce(into: Array(repeating:0, count:k+1)) { memo, pile in // <-- you only need a 1-D array!
            for j in (0 ... k).reversed() {
                var maxSum = 0
                (0...min(piles[pile].count,j)).reduce(into: 0) { sum,c in
                    if c > 0 {
                        sum += piles[pile][c-1]
                    }
                    maxSum = max(maxSum, memo[j-c] + sum)
                }
                memo[j] = maxSum
            }
         }[k]
    }
    
    func tests() {
        print(maxValueOfCoins([[1,100,3],[7,8,9]], 2)) // 101
        print(maxValueOfCoins([[100],[100],[100],[100],[100],[100],[1,1,1,1,1,1,700]], 7)) // 706
    }
}

