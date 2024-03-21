class NextPermutation {
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        guard n > 2 else { nums.reverse(); return }
        var pos: Int?
        for (i, num) in nums.enumerated().reversed().dropFirst() {
            if num < nums[i + 1] {
                pos = i
                break
            }
        }
        guard let pos = pos else { nums.reverse(); return }
        var temp: Int?
        for i in (pos+1)..<n {
            if nums[i] <= nums[pos] {
                temp = i - 1
                break
            }
        }
        let pos2 = temp ?? (n - 1)
        nums.swapAt(pos, pos2)
        var left = pos + 1
        var right = n - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
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

