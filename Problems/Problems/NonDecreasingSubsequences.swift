class NonDecreasingSubsequences {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = []
        var sequence: [Int] = []
        backtrack(nums, index: 0, sequence: &sequence, result: &result)
        return Array(result)
    }
    
    func backtrack(_ nums: [Int], index: Int, sequence: inout [Int], result: inout Set<[Int]>) {
        if (index == nums.count) {
            if (sequence.count >= 2) {
                result.insert(sequence)
            }
            return
        }
        if sequence.isEmpty || sequence[sequence.count - 1] <= nums[index] {
            sequence.append(nums[index])
            backtrack(nums, index: index + 1, sequence: &sequence, result: &result)
            sequence.remove(at: sequence.count - 1)
        }
        backtrack(nums, index: index + 1, sequence: &sequence, result: &result)
    }

    func tests() {
        print(findSubsequences([4,6,7,7]))
        // [[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]
        print(findSubsequences([4,4,3,2,1]))
        // [[4,4]]
    }
}
