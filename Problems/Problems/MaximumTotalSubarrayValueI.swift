final class MaximumTotalSubarrayValueI {
    func maxTotalValue(_ nums: [Int], _ k: Int) -> Int {
        var (minVal, maxVal) = (Int.max, Int.min)
        for num in nums {
            minVal = min(minVal, num)
            maxVal = max(maxVal, num)
        }
        return (maxVal - minVal) * k
    }
    
    func tests() {
        print(maxTotalValue([1,3,2], 2)) // 4
        print(maxTotalValue([4,2,5,1], 3)) // 12
    }
}
