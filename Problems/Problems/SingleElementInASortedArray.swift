class SingleElementInASortedArray {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            if nums[mid] != nums[mid - 1] && nums[mid] != nums[mid + 1] {
                return nums[mid]
            }
            if nums[mid] == nums[mid - 1] {
                if (mid - left) % 2 == 0 {
                    right = mid
                } else {
                    left = mid + 1
                }
            } else {
                if (right - mid) % 2 == 0 {
                    left = mid
                } else {
                    right = mid - 1
                }
            }
        }
        
        return nums[left]
    }
    
    func tests() {
        print(singleNonDuplicate([1,1,2])) // 2
        print(singleNonDuplicate([1,1,2,3,3,4,4,8,8])) // 2
        print(singleNonDuplicate([3,3,7,7,10,11,11])) // 10
    }
}
