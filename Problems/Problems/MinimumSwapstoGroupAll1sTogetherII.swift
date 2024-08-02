class MinimumSwapstoGroupAll1sTogetherII {
    func minSwaps(_ nums: [Int]) -> Int {
        let n = nums.count
        let ones = nums.reduce(0, +)
        guard ones != 0 && ones != n else { return 0 }
        var l = 0
        var r = ones - 1
        var cur = nums.prefix(ones).reduce(0, +)
        var result = ones - cur
        while l < n {
            cur += nums[(r + 1) % n] - nums[l]
            result = min(result, ones - cur)
            l += 1
            r += 1
        }
        return result
    }
    
    func tests() {
        print(minSwaps([0,1,0,1,1,0,0])) // 1
        print(minSwaps([0,1,1,1,0,0,1,1,0])) // 2
        print(minSwaps([1,1,0,0,1])) // 0
        print(minSwaps([0,1,0,0,1,0,0,0,1])) // 1
    }
}

