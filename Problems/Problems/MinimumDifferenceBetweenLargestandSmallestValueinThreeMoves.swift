class MinimumDifferenceBetweenLargestandSmallestValueinThreeMoves {
    func minDifference(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 4 else { return 0 }
        let nums = nums.sorted()
        var result = Int.max
        for i in 0..<4 {
            result = min(result, nums[n - 1 - i] - nums[3 - i])
        }
        return result
    }
    
    func tests() {
        print(minDifference([5,3,2,4])) // 0
        print(minDifference([1,5,0,10,14])) // 1
        print(minDifference([3,100,20])) // 0
        print(minDifference([82,81,95,75,20])) // 1
    }
}

