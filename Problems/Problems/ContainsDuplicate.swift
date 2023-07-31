class ContainsDuplicate {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }
        
        return dictSolution(nums)
    }
    
    func dictSolution(_ nums: [Int]) -> Bool {
        var dict: [Int: Int] = [:]
        
        for num in nums {
            if dict[num] != nil {
                return true
            }
            dict[num] = 1
        }
        
        return false
    }
    
    func sortedSolution(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }
        let sortedNums = nums.sorted()
        var prev = sortedNums.first
        for num in sortedNums.dropFirst() {
            if prev == num {
                return true
            }
            prev = num
        }
        return false
    }
    
    func setSolution(_ nums: [Int]) -> Bool {
        Set(nums).count < nums.count
    }
    
    func tests() {
        print(containsDuplicate([3, 1])) // false
        print(containsDuplicate([])) // false
        print(containsDuplicate([1])) // false
        print(containsDuplicate([1,2,3,1])) // true
        print(containsDuplicate([1,2,3,4])) // false
        print(containsDuplicate([1,1,1,3,3,4,3,2,4,2])) // true
    }
}
