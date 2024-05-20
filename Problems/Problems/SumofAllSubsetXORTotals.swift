class SumofAllSubsetXORTotals {
    func subsetXORSum(_ nums: [Int]) -> Int {
        let result = nums.reduce(0, |)
        return result << (nums.count - 1)
    }
    
    func subsetXORSum1(_ nums: [Int]) -> Int {
        func backtrack(_ idx: Int, _ curSum: Int) -> Int {
            guard idx < nums.count else { return curSum }
            return backtrack(idx + 1, curSum ^ nums[idx]) + backtrack(idx + 1, curSum)
        }
        return backtrack(0, 0)
    }
    
    func subsetXORSum0(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0
        func backtrack(_ idx: Int, _ curSum: Int) {
            guard idx < n else { return }
            result += curSum ^ nums[idx]
            backtrack(idx + 1, curSum ^ nums[idx])
            backtrack(idx + 1, curSum)
        }
        backtrack(0, 0)
        return result
    }

    func tests() {
        print(subsetXORSum([1,3])) // 6
        print(subsetXORSum([5,1,6])) // 28
        print(subsetXORSum([3,4,5,6,7,8])) // 480
    }
}

