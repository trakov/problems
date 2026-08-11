final class SmallestMissingIntegerGreaterThanSequentialPrefixSum {
    func missingInteger(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] + 1 }
        let set = Set(nums)
        var prefixLen = 1
        for (i, num) in nums.enumerated().dropFirst() {
            if num == nums[i - 1] + 1 {
                prefixLen += 1
            } else {
                break
            }
        }
        var result = ((nums[prefixLen - 1] + nums[0]) * prefixLen) / 2
        while set.contains(result) {
            result += 1
        }
        return result
    }
    
    func tests() {
        print(missingInteger([1,2,3,2,5])) // 6
        print(missingInteger([3,4,5,1,12,14,13])) // 15
    }
}
