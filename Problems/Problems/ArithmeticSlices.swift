class ArithmeticSlices {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        var diff = Int.max
        var diffCount = 0
        var result = 0
        for i in 0..<nums.count {
            guard i != nums.count - 1 else {
                result += (1+(diffCount-1)) * max(diffCount-1, 0) / 2
                break
            }
            var nextDiff = nums[i+1] - nums[i]
            if nextDiff == diff {
                diffCount += 1
            } else {
                result += (1+(diffCount-1)) * max(diffCount-1, 0) / 2
                diff = nextDiff
                diffCount = 1
            }
        }
        return result
    }

    func tests() {
        print(numberOfArithmeticSlices([1,2,3,4])) // 3
        print(numberOfArithmeticSlices([1,2,3,4,6])) // 3
        print(numberOfArithmeticSlices([1])) // 0
    }
}
