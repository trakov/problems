class RotateArray {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let kk = k % nums.count
        guard kk != 0 else { return }
        guard nums.count != kk else { return }
        nums = Array(nums[nums.count - kk ..< nums.count]) + Array(nums[0..<nums.count - kk])
    }
    
    func stepByStep(_ nums: inout [Int], _ k: Int) {
        guard nums.count != k else { return }
        let kk = k % nums.count
        let n = nums.count
        for _ in 0 ..< kk {
            let temp = nums.removeLast()
            nums.insert(temp, at: 0)
        }
    }
    
    func useSuffix(_ nums: inout [Int], _ k: Int) {
        guard nums.count != k else { return }
        let kk = k % nums.count
        let suffix = nums.suffix(kk)
        nums.removeLast(kk)
        nums = suffix + nums
    }
    
    func useAdditionalArray(_ nums: inout [Int], _ k: Int) {
        var result = Array(repeating: 0, count: nums.count + k)
        for (i, num) in nums.enumerated() {
            result[(i + k) % nums.count] = num
        }
        result.removeLast(k)
        nums = result
    }

    func tests() {
        var nums = [1,2,3,4,5,6,7]
        rotate(&nums, 3)
        print(nums)// [5,6,7,1,2,3,4]
        
        nums = [-1,-100,3,99]
        rotate(&nums, 2)
        print(nums)// [3,99,-1,-100]
    }
}
