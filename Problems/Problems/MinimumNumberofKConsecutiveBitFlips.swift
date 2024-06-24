class MinimumNumberofKConsecutiveBitFlips {
    func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var cur = 0
        var result = 0
        var nums = nums
        for i in 0..<n {
            if i >= k && nums[i - k] == 2 {
                cur -= 1
            }
            guard cur % 2 == nums[i] else { continue }
            guard i + k <= n else { return -1 }
            nums[i] = 2
            cur += 1
            result += 1
        }
        return result
    }
    
    func minKBitFlips2(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let sum = nums.reduce(0, +)
        guard sum != n && k > 1 else { return n - sum }
        var nums = nums
        var result = 0
        for i in 0..<n-k+1 {
            guard nums[i] == 0 else { continue }
            for j in i..<i+k {
                nums[j] = 1 - nums[j]
            }
            result += 1
        }
        for i in n-k+1..<n where nums[i] == 0 { return -1 }
        return result
    }
    
    func tests() {
        print(minKBitFlips([0,1,0], 1)) // 2
        print(minKBitFlips([1,1,0], 2)) // -1
        print(minKBitFlips([0,0,0,1,0,1,1,0], 3)) // 3
    }
}

