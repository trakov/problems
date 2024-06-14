class MinimumIncrementtoMakeArrayUnique {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var result = 0
        var least = nums[0] + 1
        for num in nums.dropFirst() {
            if num >= least {
                least = num + 1
            } else {
                result += least - num
                least += 1
            }
        }
        return result
    }
    
    func tests() {
        print(minIncrementForUnique([1,2,2])) // 1
        print(minIncrementForUnique([3,2,1,2,1,7])) // 6
    }
}

