class MinimumLimitofBallsinaBag {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        func ops(_ bag: Int) -> Int {
            var count = 0
            for num in nums {
                count += (num + bag - 1) / bag - 1
                if count > maxOperations {
                    break
                }
            }
            return count
        }
        
        var left = 1
        var right = nums.max()!
        while left < right {
            let mid = (left + right) / 2
            let count = ops(mid)
            if count <= maxOperations {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func tests() {
        print(minimumSize([9], 2)) // 3
        print(minimumSize([2,4,8,2], 4)) // 2
    }
}

