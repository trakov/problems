class MaximumCandiesAllocatedtoKChildren {
    func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
        let sum = candies.reduce(0, +)
        let maxVal = candies.max()!
        let candies = candies.sorted(by: >).prefix(k)
        var left = 0
        var right = min(maxVal, sum/k)
        func canSplit(_ n: Int) -> Bool {
            guard n > 0 else { return false }
            var count = 0
            for candy in candies where candy >= n && count < k {
                count += candy/n
            }
            return count >= k
        }
        var result = 0
        while left <= right {
            let mid = (left + right + 1) / 2
            if canSplit(mid) {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
    
    func tests() {
        print(maximumCandies([5,8,6], 3)) // 5
        print(maximumCandies([2,5], 11)) // 0
        print(maximumCandies([4,7,5], 16)) // 1
    }
}

