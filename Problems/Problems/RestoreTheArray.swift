class RestoreTheArray {
    func numberOfArrays(_ s: String, _ k: Int) -> Int {
        let m = s.count
        var dp = Array(repeating: 0, count: m + 1)
        let s = Array(s)
        let mod = 1_000_000_007
        func dfs(_ start: Int) -> Int {
            if dp[start] != 0 { return dp[start] }
            if start == m { return 1 }
            if s[start] == "0" { return 0 }
            var count = 0
            for end in start..<m {
                let currNumber = Int(String(s[start..<(end + 1)]))
                if currNumber! > k {
                    break
                }
                count = (count + dfs(end + 1)) % mod
            }
            dp[start] = count
            return count
        }
        return dfs(0)
    }
    
    func tests() {
        print(numberOfArrays("1000", 10000)) // 1
        print(numberOfArrays("1000", 10)) // 0
        print(numberOfArrays("1317", 2000)) // 8
        print(numberOfArrays("1307", 120)) // 1
    }
}

