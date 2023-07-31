class BinarySearch {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var index = (left + right) / 2
            if nums[index] < target {
                left = index + 1
            } else if nums[index] > target {
                right = index - 1
            } else {
                return index
            }
        }
        return -1
    }

    func tests() {
        print(search([5], 5)) // 0
        print(search([-1,0,3,5,9,12], 9)) // 4
        print(search([-1,0,3,5,9,12], 2)) // -1
    }
}
