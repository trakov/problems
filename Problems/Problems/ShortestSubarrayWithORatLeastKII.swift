class ShortestSubarrayWithORatLeastKII {
    func minimumSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var minLength = Int.max
        var (left, right) = (0, 0)
        var bitCounts = Array(repeating: 0, count: 32)
        
        func updateBitCounts(_ number: Int, _ delta: Int) {
            for bitPosition in 0..<32 {
                if ((number >> bitPosition) & 1) != 0 {
                    bitCounts[bitPosition] += delta
                }
            }
        }

        func convertBitCountsToNumber() -> Int {
            var result = 0
            for bitPosition in 0..<32 {
                if bitCounts[bitPosition] != 0 {
                    result |= 1 << bitPosition
                }
            }
            return result
        }

        while right < nums.count {
            updateBitCounts(nums[right], 1)
            while left <= right && convertBitCountsToNumber() >= k {
                minLength = min(minLength, right - left + 1)
                updateBitCounts(nums[left], -1)
                left += 1
            }
            right += 1
        }
        return minLength == Int.max ? -1 : minLength
    }

    func tests() {
        print(minimumSubarrayLength([1,2,3], 2)) // 1
        print(minimumSubarrayLength([2,1,8], 10)) // 3
        print(minimumSubarrayLength([1,2], 0)) // 1
    }
}

