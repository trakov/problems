final class MinimumOperationstoSortaPermutation {
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n >= 1 else { return 0 }
        var start = 0
        while nums[start] != 0 {
            start += 1
        }
        var (asc, desc) = (true, true)
        for i in 1..<n {
            let value = nums[(start + i) % n]
            if value != i {
                asc = false
            }
            if value != n - i {
                desc = false
            }
            if !asc && !desc {
                return -1
            }
        }
        if asc {
            return min(start, n - start + 2)
        }
        return min(n - start, start + 2)
    }
    
    func tests() {
        print(minOperations([0,2,1])) // 2
        print(minOperations([1,0,2])) // 2
        print(minOperations([2,0,1,3])) // -1
    }
}
