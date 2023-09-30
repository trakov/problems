class One32Pattern {
    func find132pattern(_ nums: [Int]) -> Bool {
        var stack: [[Int]] = []
        var currMin = nums[0]
        for k in 1..<nums.count {
            while !stack.isEmpty && stack.last![0] < nums[k] {
                stack.removeLast()
            }
            if !stack.isEmpty && nums[k] > stack.last![1] && nums[k] < stack.last![0] {
                return true
            }
            stack.append([nums[k], currMin])
            currMin = min(currMin, nums[k])
        }
        return false
    }
    
    func tests() {
        print(find132pattern([1,2,3,4])) // false
        print(find132pattern([3,1,4,2])) // true
        print(find132pattern([-1,3,2,0])) // true
    }
}
