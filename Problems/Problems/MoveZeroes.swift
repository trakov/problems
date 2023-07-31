class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums.swapAt(i, j)
                j += 1
            }
        }
    }

    func moveZeroes3(_ nums: inout [Int]) {
        var slow = 0
        var fast = 0
        while fast < nums.count {
            if nums[fast] != 0 {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        while slow < nums.count {
            nums[slow] = 0
            slow += 1
        }
    }
    
    func moveZeroes2(_ nums: inout [Int]) {
//        let count = nums.count
//        nums = nums.filter { $0 != 0 }
//        nums.append(contentsOf: Array(repeating: 0, count: count - nums.count))
        var i = 0
        var j = nums.count
        while i != j {
            if nums[i] == 0 {
                nums.remove(at: i)
                nums.append(0)
                j -= 1
            } else {
                i += 1
            }
        }
    }
    
    func tests() {
        var nums = [0,1,0,3,12]
//        moveZeroes(&nums)
//        print(nums) // [1,3,12,0,0]
//
//        nums = [0]
//        moveZeroes(&nums)
//        print(nums) // [0]
//
        nums = [2,1]
        moveZeroes(&nums)
        print(nums) // [2,1]
    }
}
