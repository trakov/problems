class LongestStrictlyIncreasingorStrictlyDecreasingSubarray {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var result = 1
        var cur = 1
        var sign = 0
        for (i, num) in (nums + [nums.last!]).enumerated().dropFirst() {
            guard nums[i - 1] != num else { cur = 1; sign = 0; continue }
            if nums[i - 1] < num {
                if sign == 1 {
                    cur += 1
                } else {
                    cur = 2
                }
            } else {
                if sign == -1 {
                    cur += 1
                } else {
                    cur = 2
                }
            }
            sign = (num - nums[i - 1]).signum()
            result = max(result, cur)
        }
        return result
    }
    
    func tests() {
        print(longestMonotonicSubarray([1,4,3,3,2])) // 2
        print(longestMonotonicSubarray([3,3,3,3])) // 1
        print(longestMonotonicSubarray([3,2,1])) // 3
    }
}

