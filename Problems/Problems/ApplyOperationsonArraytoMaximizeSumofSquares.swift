final class ApplyOperationsonArraytoMaximizeSumofSquares {
    func maxSum(_ nums: [Int], _ k: Int) -> Int {
        let mod = 1_000_000_007
        var cnt = Array(repeating: 0, count: 30)
        for num in nums {
            for i in 0..<30 {
                if (num & (1 << i)) != 0 {
                    cnt[i] += 1
                }
            }
        }
        var res = 0
        for _ in 0..<k {
            var cur = 0
            for j in stride(from: 29, through: 0, by: -1) {
                if cnt[j] > 0 {
                    cur |= 1 << j
                    cnt[j] -= 1
                }
            }
            res = (res + cur * cur % mod) % mod
        }
        return res
    }
    
    func tests() {
        print(maxSum([2,6,5,8], 2)) // 261
        print(maxSum([4,5,4,7], 3)) // 90
    }
}
