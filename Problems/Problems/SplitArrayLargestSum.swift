class SplitArrayLargestSum {
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        func minimumSubarraysRequired(_ maxSumAllowed: Int) -> Int {
            var curSum = 0
            var splits = 1
            for num in nums {
                if curSum + num <= maxSumAllowed {
                    curSum += num
                } else {
                    curSum = num
                    splits += 1
                }
            }
            return splits
        }

        var right = 0
        var left = Int.min
        for num in nums {
            right += num
            left = max(left, num)
        }

        var minSum = 0
        while left <= right {
            let mid = left + (right - left) / 2
            if minimumSubarraysRequired(mid) <= k {
                right = mid - 1
                minSum = mid
            } else {
                left = mid + 1
            }
        }
        return minSum
    }

    func tests() {
        print(splitArray([7,2,5,10,8], 2)) // 18
        print(splitArray([1,2,3,4,5], 2)) // 9
    }
}

