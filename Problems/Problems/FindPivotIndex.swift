class FindPivotIndex {
    func pivotIndex(_ nums: [Int]) -> Int {
        var leftSum = 0
        var rightSum = nums.reduce(0) { $0 + $1 } - nums[0]
        for i in 0..<nums.count {
            if leftSum == rightSum { return i }
            if i + 1 == nums.count { break }
            leftSum += nums[i]
            rightSum -= nums[i + 1]
        }
        return -1
    }

    func tests() {
        print(pivotIndex([1,7,3,6,5,6])) // 3
        print(pivotIndex([1,2,3])) // -1
        print(pivotIndex([2,1,-1])) // 0
    }
}
