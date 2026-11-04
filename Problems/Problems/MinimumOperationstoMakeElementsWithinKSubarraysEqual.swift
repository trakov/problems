final class MinimumOperationstoMakeElementsWithinKSubarraysEqual {
    private class MultiSet {
        var counts: [Int: Int] = [:]
        var sorted: [Int] = []
        var size = 0
        var sum = 0

        func add(_ value: Int) {
            if counts[value] == nil {
                let index = lowerBound(value)
                sorted.insert(value, at: index)
                counts[value] = 1
            } else {
                counts[value, default: 0] += 1
            }
            size += 1
            sum += value
        }

        func remove(_ value: Int) {
            let count = counts[value]!
            if count == 1 {
                counts.removeValue(forKey: value)
                let index = lowerBound(value)
                sorted.remove(at: index)
            } else {
                counts[value] = count - 1
            }
            size -= 1
            sum -= value
        }

        func min() -> Int {
            return sorted[0]
        }

        func max() -> Int {
            return sorted[sorted.count - 1]
        }

        private func lowerBound(_ value: Int) -> Int {
            var left = 0
            var right = sorted.count
            while left < right {
                let mid = (left + right) / 2
                if sorted[mid] < value {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }
    }

    private func getCosts(_ nums: [Int], _ x: Int) -> [Int] {
        let n = nums.count
        var ops = [Int](repeating: 0, count: n)
        let left = MultiSet()
        let right = MultiSet()

        for i in 0..<n {
            var value = nums[i]
            if left.size == 0 || value <= left.max() {
                left.add(value)
            } else {
                right.add(value)
            }

            if i >= x {
                value = nums[i - x]
                if left.counts[value] != nil {
                    left.remove(value)
                } else {
                    right.remove(value)
                }
            }

            if left.size > right.size + 1 {
                value = left.max()
                left.remove(value)
                right.add(value)
            } else if left.size < right.size {
                value = right.min()
                right.remove(value)
                left.add(value)
            }

            if i >= x - 1 {
                let mid = left.max()
                ops[i] = mid * left.size - left.sum + right.sum - mid * right.size
            }
        }
        return ops
    }

    func minOperations(_ nums: [Int], _ x: Int, _ k: Int) -> Int {
        let n = nums.count
        let ops = getCosts(nums, x)
        var pre = [Int](repeating: 0, count: n + 1)
        var cur = [Int](repeating: 0, count: n + 1)

        for j in 1...k {
            cur = [Int](repeating: Int.max, count: n + 1)
            for i in (j * x)...n {
                cur[i] = min(cur[i - 1], pre[i - x] + ops[i - 1])
            }
            swap(&pre, &cur)
        }
        return pre[n]
    }

    func tests() {
        print(minOperations([5,-2,1,3,7,3,6,4,-1], 3, 2)) // 8
        print(minOperations([9,-2,-2,-2,1,5], 2, 2)) // 3
    }
}
