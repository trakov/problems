final class XORAfterRangeMultiplicationQueriesII {
    func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let mod = 1_000_000_007

        func pow(_ x: Int, _ y: Int) -> Int {
            var result = 1
            var (x, y) = (x, y)
            while y > 0 {
                if (y & 1) == 1 {
                    result = (result * x) % mod
                }
                x = (x * x) % mod
                y >>= 1
            }
            return result
        }

        let n = nums.count
        let T = Int(Double(n).squareRoot())
        var nums = nums
        var groups: [[[Int]]] = Array(repeating: [], count: T)
        for q in queries {
            let (l, r, k, v) = (q[0], q[1], q[2], q[3])
            if k < T {
                groups[k].append([l, r, v])
            } else {
                var i = l
                while i <= r {
                    nums[i] = (nums[i] * v) % mod
                    i += k
                }
            }
        }
        for k in 1..<T where !groups[k].isEmpty {
            var dif = Array(repeating: 1, count: n + T)
            for q in groups[k] {
                let (l, r, v) = (q[0], q[1], q[2])
                dif[l] = (dif[l] * v) % mod
                let R = ((r - l) / k + 1) * k + l
                dif[R] = (dif[R] * pow(v, mod - 2)) % mod
            }
            for i in k..<n {
                dif[i] = (dif[i] * dif[i - k]) % mod
            }
            for i in 0..<n {
                nums[i] = (nums[i] * dif[i]) % mod
            }
        }
        return nums.reduce(0, ^)
    }
    
    func tests() {
        print(xorAfterQueries([1,1,1], [[0,2,1,4]])) // 4
        print(xorAfterQueries([2,3,1,5,4], [[1,4,2,3],[0,2,1,2]])) // 31
    }
}
