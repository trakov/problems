class MinimumOperationstoMakeaUniValueGrid {
    func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
        let nums = grid.flatMap { $0 }.sorted()
        var result = 0
        let n = nums.count
        let median = nums[n/2]
        for num in nums {
            guard num % x == median % x else { return -1 }
            result += abs(median - num) / x
        }
        return result
    }
    
    func tests() {
        print(minOperations([[2,4],[6,8]], 2)) // 4
        print(minOperations([[1,5],[2,3]], 1)) // 5
        print(minOperations([[1,2],[3,4]], 2)) // -1
    }
}

