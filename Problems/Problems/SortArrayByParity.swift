class SortArrayByParity {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var nums = nums
        let n = nums.count
        var left = 0
        var right = n - 1
        while left < right {
            if nums[left] % 2 == 0 {
                left += 1
            } else if nums[right] % 2 == 1 {
                right -= 1
            } else {
                nums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        return nums
    }
    
    func tests() {
        print(sortArrayByParity([3,1,2,4])) // [2,4,3,1]
        print(sortArrayByParity([1,2,3,4,5])) // [2,4,3,1,5]
        print(sortArrayByParity([6,2,0,4,8])) // [6,2,0,4,8]
        print(sortArrayByParity([1,3,5])) // [1,3,5]
        print(sortArrayByParity([0])) // [0]
    }
}

