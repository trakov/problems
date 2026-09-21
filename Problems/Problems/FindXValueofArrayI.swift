final class FindXValueofArrayI {
    func resultArray(_ nums: [Int], _ k: Int) -> [Int] {
        var result = Array(repeating: 0, count: k)
        var dp = Array(repeating: 0, count: k)
        for num in nums {
            var ndp = Array(repeating: 0, count: k)
            ndp[num % k] += 1
            for r in 0..<k {
                ndp[(r * num) % k] += dp[r]
            }
            dp = ndp
            for (i, d) in dp.enumerated() {
                result[i] += d
            }
        }
        return result
    }
    
    func tests() {
        print(resultArray([1,2,3,4,5], 3)) // [9,2,4]
        print(resultArray([1,2,4,8,16,32], 4)) // [18,1,2,0]
        print(resultArray([1,1,2,1,1], 2)) // [9,6]
    }
}
