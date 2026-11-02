final class MinimumMovestoEqualArrayElementsII {
    func minMoves2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let median = nums[nums.count / 2]
        return nums.reduce(0) { $0 + abs($1 - median) }
    }
    
    func tests() {
        print(minMoves2([1,2,2])) // 1
        print(minMoves2([1,1,2])) // 1
        print(minMoves2([1,2,3])) // 2
        print(minMoves2([1,10,2,9])) // 16
        print(minMoves2([1,0,0,8,6])) // 14
    }
}
