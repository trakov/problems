final class SortedGCDPairQueries {
    func gcdValues(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let m = nums.max()!
        var cnt = Array(repeating: 0, count: m + 1)
        for num in nums {
            cnt[num] += 1
        }
        for i in 1...m {
            for j in stride(from: i * 2, through: m, by: i) {
                cnt[i] += cnt[j]
            }
        }
        for i in 1...m {
            cnt[i] = (cnt[i] * (cnt[i] - 1)) / 2
        }
        for i in (1...m).reversed() {
            for j in stride(from: i * 2, through: m, by: i) {
                cnt[i] -= cnt[j]
            }
        }
        for i in 1...m {
            cnt[i] += cnt[i - 1]
        }
        var result = Array(repeating: 0, count: queries.count)
        for (i, q) in queries.enumerated() {
            let q = q + 1
            var (left, right) = (1, m)
            while left < right {
                let mid = (left + right) / 2
                if cnt[mid] >= q {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            result[i] = left
        }
        return result
    }
    
    func tests() {
        print(gcdValues([2,3,4], [0,2,2])) // [1,2,2]
        print(gcdValues([4,4,2,1], [5,3,1,0])) // [4,2,1,1]
        print(gcdValues([2,2], [0,0])) // [2,2]
    }
}
