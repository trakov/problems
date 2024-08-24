class CheckifArrayIsSortedandRotated {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 2 else { return true }
        var index = -1
        for (i, num) in nums.enumerated().dropFirst() {
            if num < nums[i - 1] {
                index = i
                break
            }
        }
        if index == -1 { return true }
        
        guard nums[index] <= nums[0] else { return false }
        
        for i in index..<n-1 {
            if nums[i + 1] < nums[i] {
                return false
            }
        }
        
        return nums.last! <= nums.first!
    }
    
    func tests() {
        print(check([3,4,5,1,2])) // true
        print(check([2,1,3,4])) // false
        print(check([1,2,3])) // true
    }
}

