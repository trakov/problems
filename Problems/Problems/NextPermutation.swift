class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2
        while i >= 0 && nums[i + 1] <= nums[i] {
            i -= 1
        }
        if i >= 0 {
            var j = nums.count - 1
            while nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        i += 1
        var right = nums.count - 1
        while i < right {
            nums.swapAt(i, right)
            i += 1
            right -= 1
        }
    }
    
    func tests() {
        var nums = [1,2,3]
        nextPermutation(&nums)
        print(nums) // [1,3,2]
        
        nums = [1,3,2]
        nextPermutation(&nums)
        print(nums) // [2,1,3]

        nums = [3,2,1]
        nextPermutation(&nums)
        print(nums) // [1,2,3]
        
        nums = [1,2]
        nextPermutation(&nums)
        print(nums) // [2,1]
    }
}

