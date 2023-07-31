class MinimizeMaximumOfArray {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        var result = Int.min
        var curSum = 0
        for i in 0..<nums.count {
            curSum += nums[i]
            result = max(result, Int((Double(curSum) / Double(i + 1)).rounded(.up)))
        }
        return result
    }
    
    func tests() {
        print(minimizeArrayValue([13,13,20,0,8,9,9])) // 16
        print(minimizeArrayValue([3,7,1,6])) // 5
        print(minimizeArrayValue([10,1])) // 10
    }
}

