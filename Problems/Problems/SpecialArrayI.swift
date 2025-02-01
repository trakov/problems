class SpecialArrayI {
    func isArraySpecial(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        for (i, num) in nums.enumerated().dropFirst() {
            if (nums[i - 1] + num) % 2 == 0 {
                return false
            }
        }
        return true
    }
    
    func tests() {
        print(isArraySpecial([1])) // true
        print(isArraySpecial([2,1,4])) // true
        print(isArraySpecial([4,3,1,6])) // false
    }
}

