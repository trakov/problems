class FindPeakElement {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        if nums[0] > nums[1] { return 0 }
        if nums[nums.count - 1] > nums[nums.count - 2] { return nums.count - 1 }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if (nums[mid] > nums[mid + 1]) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func tests() {
        print(findPeakElement([1,2,3,1])) // 2
        print(findPeakElement([1,2,1,3,5,6,4])) // 5
    }
}
