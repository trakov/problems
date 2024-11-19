class MaximumSumofDistinctSubarraysWithLengthK {
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var sum = 0
        var map: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            map[num, default: 0] += 1
            sum += num
            guard i >= k - 1 else { continue }
            if map.count == k {
                result = max(result, sum)
            }
            let first = nums[i - k + 1]
            sum -= first
            map[first]! -= 1
            if map[first]! == 0 { map[first] = nil }
        }
        return result
    }
    
    func tests() {
        print(maximumSubarraySum([1,5,4,2,9,9,9], 3)) // 15
        print(maximumSubarraySum([1,5,4,2,9,9,9,1,6], 3)) // 16
        print(maximumSubarraySum([4,4,4], 3)) // 0
    }
}

