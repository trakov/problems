class MonotonicArray {
    func isMonotonic(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return true }
        var dir = (nums.last! - nums.first!).signum() // -1 - dec, 1 - inc, 0 - const
        for i in 1..<nums.count {
            if dir == 0 && nums[i - 1] != nums[i] { return false }
            if dir == -1 && nums[i - 1] < nums[i] { return false }
            if dir == 1 && nums[i - 1] > nums[i] { return false }
        }
        return true
    }
    
    func tests() {
        print(isMonotonic([1,2,2,3])) // true
        print(isMonotonic([6,5,4,4])) // true
        print(isMonotonic([1,3,2])) // false
    }
}

