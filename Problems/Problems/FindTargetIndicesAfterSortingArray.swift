final class FindTargetIndicesAfterSortingArray {
    func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        let nums = nums.sorted()
        for (i, num) in nums.enumerated() where num == target {
            result.append(i)
        }
        return result
    }
    
    func tests() {
        print(targetIndices([1,2,5,2,3], 2)) // [1,2]
        print(targetIndices([1,2,5,2,3], 3)) // [3]
        print(targetIndices([1,2,5,2,3], 5)) // [4]
    }
}
