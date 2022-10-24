class SearchInsertPosition {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while right >= left {
            let index = (left + right) / 2
            if target > nums[index] {
                left = index + 1
            } else if target < nums[index] {
                right = index - 1
            } else {
                return index
            }
        }
        return left
    }
    
    func tests() {
        print(searchInsert([1,3], 2)) // 1
        print(searchInsert([1,3,5,6], 0)) // 0
        print(searchInsert([1,3,5,6], 5)) // 2
        print(searchInsert([1,3,5,6], 2)) // 1
        print(searchInsert([1,3,5,6], 7)) // 4
    }
}
