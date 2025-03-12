class MaximumCountofPositiveIntegerandNegativeInteger {
    func maximumCount(_ nums: [Int]) -> Int {
        let n = nums.count
        func bs(_ target: Int) -> Int {
            var (left, right) = (0, n - 1)
            var result = 0
            while left <= right {
                let mid = (left + right) / 2
                if nums[mid] < target {
                    left = mid + 1
                } else {
                    result = mid
                    right = mid - 1
                }
            }
            return result
        }
        let negCount = bs(0)
        let posCount = n - bs(1)
        return max(negCount, posCount)
    }

    func tests() {
        print(maximumCount([-2,-1,-1,1,2,3])) // 3
        print(maximumCount([-3,-2,-1,0,0,1,2])) // 3
        print(maximumCount([5,20,66,1314])) // 4
    }
}

