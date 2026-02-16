final class FindtheSmallestDivisorGivenaThreshold {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        guard nums.count <= threshold else { preconditionFailure() }
        var sum = 0
        var maxEl = 0
        for num in nums {
            sum += num
            maxEl = max(maxEl, num)
        }
        guard sum > threshold else { return 1 }
        var left = 2
        var right = maxEl
        
        func helper(_ d: Int) -> Int {
            var sum = 0
            for num in nums {
                sum += num / d
                if num % d != 0 {
                    sum += 1
                }
            }
            return sum
        }
        
        while left < right {
            let mid = (left + right) / 2
            let s = helper(mid)
            if s <= threshold {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return right
    }
    
    func tests() {
        print(smallestDivisor([1,2,5,9], 6)) // 5
        print(smallestDivisor([44,22,33,11,1], 5)) // 44
    }
}
