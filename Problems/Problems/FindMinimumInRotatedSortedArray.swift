class FindMinimumInRotatedSortedArray {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            if nums[left] < nums[right] {
                return nums[left]
            }
            let mid = (left + right) / 2
            if nums[mid] < nums[left] && nums[mid] < nums[right] {
                right = mid
                continue
            }
            if nums[left] < nums[mid] {
                left = mid + 1
            } else if nums[right] > nums[mid] {
                right = mid - 1
            } else {
                return nums[right]
            }
        }
        
        return nums[left]
    }

    func tests() {
        print(findMin([1,2,3])) // 1
        print(findMin([2,3,1])) // 1
        print(findMin([3,1,2])) // 1
        print(findMin([1,2,3,4,5])) // 1
        print(findMin([2,3,4,5,1])) // 1
        print(findMin([3,4,5,1,2])) // 1
        print(findMin([4,5,1,2,3])) // 1
        print(findMin([5,1,2,3,4])) // 1
        print(findMin([4,5,6,7,0,1,2])) // 0
        print(findMin([11,13,15,17])) // 11
    }
}
