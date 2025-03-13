class ZeroArrayTransformationII {
    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
        guard !nums.isEmpty else { return -1 }
        func canMakeZero( _ position: Int) -> Bool {
            let numsCount = nums.count
            var decrements = Array(repeating: 0, count: numsCount + 1)
            for index in 0 ..< position {
                let query = queries[index]
                decrements[query[0]] += query[2]
                decrements[query[1] + 1] -= query[2]
            }
            var currDecrements = 0
            for index in 0 ..< numsCount {
                currDecrements += decrements[index]
                if currDecrements < nums[index] {
                    return false
                }
            }
            return true
        }
        var left = 0
        var right = queries.count
        var queryProcessed = -1
        while left <= right {
            let mid = left + (right - left)/2
            if canMakeZero(mid) {
                right = mid - 1
                queryProcessed = mid
            } else {
                left = mid + 1
            }
        }
        return queryProcessed
    }

    func tests() {
        print(minZeroArray([2,0,2], [[0,2,1],[0,2,1],[1,1,3]])) // 2
        print(minZeroArray([4,3,2,1], [[1,3,2],[0,2,1]])) // -1
    }
}

