final class MaximumKtoSortaPermutation {
    func sortPermutation(_ nums: [Int]) -> Int {
        var result = Int.max
        for (i, num) in nums.enumerated() where num != i {
            result &= nums[i]
        }
        return result == Int.max ? 0 : result
    }
    
    func tests() {
        print(sortPermutation([0,3,2,1])) // 1
        print(sortPermutation([0,1,3,2])) // 2
        print(sortPermutation([3,2,1,0])) // 0
    }
}
