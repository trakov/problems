class MoveZeroes {
    func moveZeroes(_ nums: inout [Int]) {
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
        moveZeroes(&nums)
        print(nums) // [1,3,12,0,0]
        
        nums = [0]
        moveZeroes(&nums)
        print(nums) // [0]
    }
}
