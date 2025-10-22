import Algorithms
final class MaximumFrequencyofanElementAfterPerformingOperationsII {
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {
        let flatNums = nums.flatMap { [$0 - k, $0, $0 + k] }
        let sortedNums = nums.sorted()
        var frequencies: [Int: Int] = [:]
        for num in nums {
            frequencies[num, default: 0] += 1
        }
        return flatNums
            .map { target in
                min(
                    sortedNums.partitioningIndex { $0 > target + k } - sortedNums.partitioningIndex { $0 >= target - k },
                    frequencies[target, default: 0] + numOperations
                )
            }
            .max()!
    }
    
    func tests() {
        print(maxFrequency([1,4,5], 1, 2)) // 2
        print(maxFrequency([5,11,20,20], 5, 1)) // 2
    }
}
