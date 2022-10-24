class ContainsDuplicate2 {
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard k > 0, nums.count > 1 else { return false }
        
        var numsDict: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            if let existingIndex = numsDict[num], index - existingIndex <= k {
                return true
            } else {
                numsDict[num] = index
            }
        }        
        return false
    }
    
    func tests() {
        print(containsNearbyDuplicate([1,2,3,1], 3))
        print(containsNearbyDuplicate([1,0,1,1], 1))
        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }
}
