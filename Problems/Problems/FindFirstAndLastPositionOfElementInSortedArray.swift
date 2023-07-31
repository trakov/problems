class FindFirstAndLastPositionOfElementInSortedArray {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [-1,-1]
        guard nums.count > 0 else { return result }
        guard nums.count > 1 else { return nums[0] == target ? [0,0] : result }
        
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (right + left) / 2
            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        guard nums[left] == target else { return result }
        
        result[0] = left
        
        right = nums.count - 1
        while left < right {
            let mid = (right + left) / 2 + 1
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid
            }
        }
        result[1] = left
        return result
    }

    func tests() {
        print(searchRange([2,2], 3)) // [-1,-1]
        print(searchRange([5,7,7,8,8,10], 8)) // [3,4]
        print(searchRange([5,7,7,8,8,10], 6)) // [-1,-1]
        print(searchRange([], 0)) // [-1,-1]
        print(searchRange([5,8,8,8,8,10], 8)) // [1,4]
        print(searchRange([5,8,8,8,8,8,8,8,9,10], 8)) // [1,7]
    }
}
