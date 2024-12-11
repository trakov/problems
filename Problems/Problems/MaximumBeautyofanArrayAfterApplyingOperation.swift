class MaximumBeautyofanArrayAfterApplyingOperation {
    func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else { return 1 }
        let maxValue = nums.max()!
        var count = Array(repeating: 0, count: maxValue + 1)
        for num in nums {
            count[max(num - k, 0)] += 1
            count[min(num + k + 1, maxValue)] -= 1
        }
        var currentSum = 0
        var result = 0
        for val in count {
            currentSum += val
            result = max(result, currentSum)
        }
        return result
    }
    
    func tests() {
        print(maximumBeauty([4,6,1,2], 2)) // 3
        print(maximumBeauty([1,1,1,1], 10)) // 4
    }
}

