class ApplyOperationstoMaximizeScore {
    let MOD = 1_000_000_007
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let primeScores = nums.map { countDistinctPrimes($0) }
        var left = Array(repeating: -1, count: n)
        var right = Array(repeating: n, count: n)
        var stack: [Int] = []
        for i in 0..<n {
            while let last = stack.last, primeScores[last] < primeScores[i] {
                right[stack.removeLast()] = i
            }
            left[i] = stack.last ?? -1
            stack.append(i)
        }
        let indices = (0..<n).sorted { nums[$0] > nums[$1] }
        var score = 1
        var remainingK = k
        for i in indices {
            let count = (i - left[i]) * (right[i] - i)
            let take = min(remainingK, count)
            score = modPow(score, 1, MOD)
            score = (score * modPow(nums[i], take, MOD)) % MOD
            remainingK -= take
            if remainingK == 0 { break }
        }
        return score
    }

    private func modPow(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
        var result = 1
        var base = base % mod
        var exp = exp
        while exp > 0 {
            if exp % 2 == 1 {
                result = (result * base) % mod
            }
            base = (base * base) % mod
            exp /= 2
        }
        return result
    }

    private func countDistinctPrimes(_ num: Int) -> Int {
        var x = num
        var count = 0
        if x % 2 == 0 {
            count += 1
            while x % 2 == 0 {
                x /= 2
            }
        }
        var i = 3
        while i * i <= x {
            if x % i == 0 {
                count += 1
                while x % i == 0 {
                    x /= i
                }
            }
            i += 2
        }
        if x > 1 {
            count += 1
        }
        return count
    }

    func tests() {
        print(maximumScore([8,3,9,3,8], 2)) // 81
        print(maximumScore([19,12,14,6,10,18], 3)) // 4788
    }
}
