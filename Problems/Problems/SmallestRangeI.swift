class SmallestRangeI {
    func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {
        var minValue = Int.max
        var maxValue = Int.min
        for num in nums {
            minValue = min(minValue, num)
            maxValue = max(maxValue, num)
        }
        return max(0, maxValue - k - minValue - k)
    }
    
    func tests() {
        print(smallestRangeI([1], 0)) // 0
        print(smallestRangeI([0,10], 2)) // 6
        print(smallestRangeI([1,3,6], 3)) // 0
    }
}

