class StudentAttendanceRecordII {
    func checkRecord(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var dp = [[1,0,0],[0,0,0]]
        var dpNext = [[0,0,0],[0,0,0]]
        for len in 0..<n {
            for a in 0...1 {
                for l in 0...2 {
                    dpNext[a][0] = (dpNext[a][0] + dp[a][l]) % mod
                    if a < 1 {
                        dpNext[a + 1][0] = (dpNext[a + 1][0] + dp[a][l]) % mod
                    }
                    if l < 2 {
                        dpNext[a][l + 1] = (dpNext[a][l + 1] + dp[a][l]) % mod
                    }
                }
            }
            dp = dpNext
            dpNext = [[0,0,0],[0,0,0]]
        }
        return dp.reduce(0) {
            ($0 + $1.reduce(0, { partialResult, num in
                partialResult + num
            })) % mod
        }
    }

    // backtrack - TLE
    func checkRecord2(_ n: Int) -> Int {
        var result = 0
        let mod = 1_000_000_007
        func backtrack(_ idx: Int, _ aCount: Int, _ lCount: Int) {
            if idx == n {
                result = (result + 1) % mod
                return
            }
            if aCount == 0 {
                backtrack(idx + 1, aCount + 1, 0)
            }
            if lCount < 2 {
                backtrack(idx + 1, aCount, lCount + 1)
            }
            backtrack(idx + 1, aCount, 0)
        }
        backtrack(0, 0, 0)
        return result
    }
    
    func tests() {
        print(checkRecord(1)) // 3
        print(checkRecord(2)) // 8
        print(checkRecord(3)) // 19
        print(checkRecord(4)) // 43
        print(checkRecord(5)) // 94
        print(checkRecord(6)) // 200
        print(checkRecord(10101)) // 183236316
    }
}

