class MinimizeMaximumPairSumInArray {
    func minPairSum(_ nums: [Int]) -> Int {
        let n = nums.count
        let nums = nums.sorted()
        var result = 0
        for i in 0..<n/2 {
            result = max(result, nums[i] + nums[n - 1 - i])
        }
        return result
    }
    
    func tests() {
        print(minPairSum([3,5,2,3])) // 7
        print(minPairSum([3,5,4,2,4,6])) // 8
    }
}

