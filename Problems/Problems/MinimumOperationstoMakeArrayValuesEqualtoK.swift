final class MinimumOperationstoMakeArrayValuesEqualtoK {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var set: Set<Int> = []
        for num in nums {
            guard num >= k else { return -1 }
            guard num > k else { continue }
            set.insert(num)
        }
        return set.count
    }
    
    func tests() {
        print(minOperations([5,2,5,4,5], 2)) // 2
        print(minOperations([2,1,2], 2)) // -1
        print(minOperations([9,7,5,3], 1)) // 4
    }
}
