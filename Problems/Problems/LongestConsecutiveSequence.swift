class LongestConsecutiveSequence {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var nums = Set(nums)
        guard nums.count > 1 else { return nums.count }
        var result = 1
        for num in nums where !nums.contains(num - 1) {
            var cur = num
            var curResult = 1
            while nums.contains(cur + 1) {
                cur += 1
                curResult += 1
            }
            result = max(result, curResult)
        }
        return result
    }

    func longestConsecutive2(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let nums = Array(Set(nums)).sorted()
        guard nums.count > 1 else { return 1 }
        var result = 1
        var temp = 1
        for i in 1..<nums.count {
            if nums[i] == nums[i - 1] + 1 {
                temp += 1
                result = max(result, temp)
            } else {
                temp = 1
            }
        }
        return result
    }
    
    func tests() {
        print(longestConsecutive([100,4,200,1,3,2])) // 4
        print(longestConsecutive([0,3,7,2,5,8,4,6,0,1])) // 9
        print(longestConsecutive([0])) // 1
        print(longestConsecutive([0,0])) // 1
        print(longestConsecutive([])) // 0
    }
}

