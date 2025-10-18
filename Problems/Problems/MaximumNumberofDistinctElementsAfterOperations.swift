final class MaximumNumberofDistinctElementsAfterOperations {
    func maxDistinctElements(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var result = 0
        var prev = Int.min
        for num in nums {
            let curr = min(max(num - k, prev + 1), num + k)
            if curr > prev {
                result += 1
                prev = curr
            }
        }
        return result
    }
    
    func tests() {
        print(maxDistinctElements([1,2,2,3,3,4], 2)) // 6
        print(maxDistinctElements([4,4,4,4], 1)) // 3
    }
}
