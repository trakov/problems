final class MaximizetheMinimumPoweredCity {
    func maxPower(_ stations: [Int], _ r: Int, _ k: Int) -> Int {
        let n = stations.count
        var cnt = Array(repeating: 0, count: n + 1)
        for i in 0..<n {
            let left = max(0, i - r)
            let right = min(n, i + r + 1)
            cnt[left] += stations[i]
            cnt[right] -= stations[i]
        }
        func check(_ val: Int) -> Bool {
            var diff = cnt
            var sum = 0
            var remaining = k
            for i in 0..<n {
                sum += diff[i]
                if sum < val {
                    let add = val - sum
                    if remaining < add {
                        return false
                    }
                    remaining -= add
                    let end = min(n, i + 2 * r + 1)
                    diff[end] -= add
                    sum += add
                }
            }
            return true
        }
        var lo = stations.min()!
        var hi = stations.reduce(0, +) + k
        var res = 0
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if check(mid) {
                res = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        return res
    }

    func tests() {
        print(maxPower([1,2,4,5,0], 1, 2)) // 5
        print(maxPower([4,4,4,4], 0, 3)) // 4
    }
}
