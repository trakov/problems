class FirstMissingPositive {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let n = nums.count
        var all = Array(repeating: 0, count: n)
        for num in nums where (num > 0 && num <= n) {
            all[num - 1] = num
        }
        for (i, num) in all.enumerated() where num != i + 1 {
            return i + 1
        }
        return n + 1
    }
    
    func firstMissingPositiveSwap(_ nums: [Int]) -> Int {
        var nums = nums
        let n = nums.count
        for i in 0..<n {
            while nums[i] > 0 && nums[i] <= n && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(nums[i] - 1, i)
            }
        }
        for (i, num) in nums.enumerated() where num != i + 1 {
            return i + 1
        }
        return n + 1
    }
    
    func tests() {
        print(firstMissingPositive([1,2,0])) // 3
        print(firstMissingPositive([3,4,-1,1])) // 2
        print(firstMissingPositive([7,8,9,11,12])) // 1
    }
}
