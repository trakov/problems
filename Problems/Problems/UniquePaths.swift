class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard n > 1 && m > 1 else { return 1 }
        guard n <= m else { return uniquePaths(n, m) }
        var memo = Array(repeating: 1, count: n)
        for _ in 1..<m {
            let prev = memo
            for j in 1..<n {
                memo[j] = memo[j - 1] + prev[j]
            }
        }
        return memo[n-1]
    }

    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
//        924 462 210 84  28  7   1
//        462 252 126 56  21  6   1
//        210 126 70  35  15  5   1
//        84  56  35  20  10  4   1
//        28  21  15  10  6   3   1
//        7   6   5   4   3   2   1
//        1   1   1   1   1   1   1
        if min(m, n) == 1 { return 1 }
        if min(m, n) == 2 { return max(m, n) }
        var res = Array(repeating: Array(repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                res[i][j] = res[i-1][j] + res[i][j-1]
            }
        }
        return res[m-1][n-1]
    }

    func tests() {
        print(uniquePaths(3, 1)) // 1
        print(uniquePaths(3, 2)) // 3
        print(uniquePaths(3, 3)) // 6
        print(uniquePaths(3, 4)) // 10
        print(uniquePaths(3, 5)) // 15
        print(uniquePaths(3, 6)) // 21
        print(uniquePaths(3, 7)) // 28
        
    }
}
