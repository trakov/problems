class MaximumXORforEachQuery {
    func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
        let n = nums.count
        var xorProduct = 0
        for num in nums {
            xorProduct = xorProduct ^ num
        }
        var result = Array(repeating: 0, count: n)
        var mask = (1 << maximumBit) - 1
        for i in 0..<n {
            result[i] = xorProduct ^ mask
            xorProduct = xorProduct ^ nums[n - 1 - i]
        }
        return result
    }
    
    func tests() {
        print(getMaximumXor([0,1,1,3], 2)) // [0,3,2,3]
        print(getMaximumXor([2,3,4,7], 3)) // [5,2,6,5]
        print(getMaximumXor([0,1,2,2,5,7], 3)) // [4,3,6,4,6,7]
    }
}

