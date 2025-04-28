final class CountSubarraysWithScoreLessThanK {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var sum = 0
        var left = 0
        for (right, num) in nums.enumerated() {
            sum += num
            while left <= right && sum * (right - left + 1) >= k {
                sum -= nums[left]
                left += 1
            }
            result += right - left + 1
        }
        return result
    }
    
    func tests() {
        print(countSubarrays([2,1,4,3,5], 10)) // 6
        print(countSubarrays([1,1,1], 5)) // 5
    }
}
