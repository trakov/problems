class SubarraySumEqualsK {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var sum = 0
        var map: [Int: Int] = [:] // sum: count
        for i in 0..<nums.count {
            map[sum, default: 0] += 1
            sum += nums[i]
            result += map[sum - k] ?? 0
        }
        return result
    }

    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        var result = 0
        
        for i in 0..<nums.count {
            for j in i..<nums.count {
                dp[j] += nums[j-i]
                if dp[j] == k { result += 1 }
            }
        }
        
        return result
    }
    
    func tests() {
        print(subarraySum([1,-1,0], 0)) // 3
        print(subarraySum([1,1,1], 2)) // 2
        print(subarraySum([1,2,3], 3)) // 2
        print(subarraySum([1,2,3,4], 3)) // 2
        print(subarraySum([1,2,3,4,1,2,3], 3)) // 4
    }
}

