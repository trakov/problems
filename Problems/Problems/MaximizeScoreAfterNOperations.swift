class MaximizeScoreAfterNOperations {
    func maxScore(_ nums: [Int]) -> Int {
        var memo = Array(repeating: 0, count: 1<<14)
        let n = nums.count
        func solve(_ k: Int, _ mask: Int) -> Int {
            guard k != 0 else { return 0 }
            if memo[mask] != 0 { return memo[mask] }
            var result = 0
            for i in 0..<n-1 {
                for j in i+1..<n {
                    let win = (n / 2 - k + 1) * gcd(nums[i], nums[j])
                    if (mask & (1<<i)) != 0 && (mask & (1<<j)) != 0 {
                        result = max(
                            result,
                            win + solve(k-1, mask ^ (1<<i) ^ (1<<j))
                        )
                    }
                }
            }
            memo[mask] = result
            return result
        }
        return solve(n/2, (1<<n) - 1)
    }

    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    
    func tests() {
        print(maxScore([1,2])) // 1
        print(maxScore([3,4,6,8])) // 11
        print(maxScore([1,2,3,4,5,6])) // 14
    }
}
