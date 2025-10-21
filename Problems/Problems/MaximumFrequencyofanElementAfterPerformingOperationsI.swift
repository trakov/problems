final class MaximumFrequencyofanElementAfterPerformingOperationsI {
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {
        let maxVal = nums.max()! + k + 2
        var count = Array(repeating: 0, count: maxVal)
        for num in nums {
            count[num] += 1
        }
        for i in 1..<maxVal {
            count[i] += count[i - 1]
        }
        var result = 0
        for i in 0..<maxVal {
            let left = max(0, i - k)
            let right = min(maxVal - 1, i + k)
            let total = count[right] - (left > 0 ? count[left - 1] : 0)
            let freq = count[i] - (i > 0 ? count[i - 1] : 0)
            result = max(result, freq + min(numOperations, total - freq))
        }
        return result
    }
    
    func tests() {
        print(maxFrequency([1,4,5], 1, 2)) // 2
        print(maxFrequency([5,11,20,20], 5, 1)) // 2
    }
}
