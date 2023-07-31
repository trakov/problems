class SearchInRotatedSortedArrayII {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard !nums.isEmpty else { return false }
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target { return true }
            if nums[left] == nums[mid] {
                left += 1
                continue
            }
            if nums[left] < nums[mid] {
                if target < nums[mid] && target >= nums[left] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return false
    }

    func tests() {
        print(search([1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1], 2)) // true
        print(search([2,5,6,0,0,1,2], 0)) // true
        print(search([2,5,6,0,0,1,2], 3)) // false
    }
}
