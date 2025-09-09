final class NumberofPeopleAwareofaSecret {
    func peopleAwareOfSecret(_ n: Int, _ delay: Int, _ forget: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        var share = 0
        for i in 2...n {
            if i - delay > 0 {
                share = (share + dp[i - delay] + mod) % mod
            }
            if i - forget > 0 {
                share = (share - dp[i - forget] + mod) % mod
            }
            dp[i] = share
        }
        var result = 0
        for i in n - forget + 1...n {
            result = (result + dp[i]) % mod
        }
        return result
    }

    func tests() {
        print(peopleAwareOfSecret(6, 2, 4)) // 5
        print(peopleAwareOfSecret(4, 1, 3)) // 6
    }
}
