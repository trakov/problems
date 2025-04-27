final class CountSubarraysofLengthThreeWithaCondition {
    func countSubarrays(_ nums: [Int]) -> Int {
        var result = 0
        for (i, num) in nums.enumerated().dropLast(2) {
            guard 2 * (num + nums[i + 2]) == nums[i + 1] else { continue }
            result += 1
        }
        return result
    }
    
    func tests() {
        print(countSubarrays([1,2,1,4,1])) // 1
        print(countSubarrays([1,1,1])) // 0
    }
}
