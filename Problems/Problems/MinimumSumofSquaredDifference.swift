final class MinimumSumofSquaredDifference {
    func minSumSquareDiff(_ nums1: [Int], _ nums2: [Int], _ k1: Int, _ k2: Int) -> Int {
        let n = nums1.count
        var k = k1 + k2
        var diffs = Array(repeating: 0, count: n)
        var maxDif = 0
        for i in 0..<n {
            diffs[i] = abs(nums1[i] - nums2[i])
            maxDif = max(maxDif, diffs[i])
        }
        var l = 0
        var r = maxDif
        var res = 0
        while l <= r {
            let mid = (l + r) >> 1
            var sum = 0
            for num in diffs {
                sum += max(0, num - mid)
            }
            if sum <= k {
                r = mid - 1
                res = mid
            } else {
                l = mid + 1
            }
        }
        for num in diffs {
            if num > res {
                k -= num - res
            }
        }
        diffs.sort()
        var ans = 0
        for i in stride(from: n - 1, through: 0, by: -1) {
            var diff = min(diffs[i], res)
            if k > 0 && diff > 0 {
                diff -= 1
                k -= 1
            }
            ans += diff * diff
        }
        return ans
    }
    
    func tests() {
        print(minSumSquareDiff([1,2,3,4], [2,10,20,19], 0, 0)) // 579
        print(minSumSquareDiff([1,4,10,12], [5,8,6,9], 1, 1)) // 43
    }
}
