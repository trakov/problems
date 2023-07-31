class SpecialArrayWithXElementsGreaterThanOrEqualX {
    func specialArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] > 0 ? 1 : -1 }
        let nums = nums.sorted()
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            let x = nums.count - mid
            if nums[mid] < x {
                left = mid + 1
            } else if mid > 0 && nums[mid - 1] < x {
                return x
            } else {
                right = mid - 1
            }
        }
        return left == 0 ? nums.count : -1
    }

    func tests() {
        print(specialArray([3,5])) // 2
        print(specialArray([0,0])) // -1
        print(specialArray([0,4,3,0,4])) // 3
    }
}
