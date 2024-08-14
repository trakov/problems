class FindKthSmallestPairDistance {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        let n = nums.count

        func countPairsWithMaxDistance(_ maxDistance: Int) -> Int {
            var count = 0
            var left = 0
            for right in 0..<n {
                while (nums[right] - nums[left] > maxDistance) {
                    left += 1
                }
                count += right - left
            }
            return count
        }
        
        var low = 0
        var high = nums[n - 1] - nums[0]

        while low < high {
            let mid = (low + high) / 2
            let count = countPairsWithMaxDistance(mid)
            if count < k {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }

    func tests() {
        print(smallestDistancePair([1,3,1], 1)) // 0
        print(smallestDistancePair([1,1,1], 2)) // 0
        print(smallestDistancePair([1,6,1], 3)) // 5
    }
}
