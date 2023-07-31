class SearchInRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        guard nums[l] != target else { return l }
        guard nums[r] != target else { return r }
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[mid] <= nums[r] {
                if nums[mid] < target && target <= nums[r] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            } else {
                if nums[l] <= target && target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }
        return -1
    }

    func tests() {
        print(search([1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1], 2)) // 13
        print(search([4,5,6,7,0,1,2], 0)) // 4
        print(search([4,5,6,7,0,1,2], 3)) // -1
        print(search([1], 0)) // -1
    }
}
