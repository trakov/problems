class CountAllPossibleRoutes {
    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        let n = locations.count
        var dp = Array(repeating: Array(repeating: 0, count: fuel + 1), count: n)
        for j in 0...fuel {
            dp[finish][j] = 1
        }
        let mod = 1000000007
        for j in 0...fuel {
            for i in 0..<n {
                for k in 0..<n {
                    if k == i {
                        continue
                    }
                    guard abs(locations[i] - locations[k]) <= j else {
                        continue
                    }
                    dp[i][j] = (dp[i][j] + dp[k][j - abs(locations[i] - locations[k])]) % mod
                }
            }
        }

        return dp[start][fuel]
    }
    
    func tests() {
        print(countRoutes([2,3,6,8,4], 1, 3, 5)) // 4
        print(countRoutes([4,3,1], 1, 0, 6)) // 5
        print(countRoutes([5,2,1], 0, 2, 3)) // 0
    }
}

