class BinarySubarraysWithSum {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var start = 0
        var prefixZeros = 0
        var currentSum = 0
        var result = 0
        for (end, num) in nums.enumerated() {
            currentSum += num
            while start < end && (nums[start] == 0 || currentSum > goal) {
                if nums[start] == 1 {
                    prefixZeros = 0
                } else {
                    prefixZeros += 1
                }
                currentSum -= nums[start]
                start += 1
            }
            if currentSum == goal {
                result += 1 + prefixZeros
            }
        }
        return result
    }

    func tests() {
        print(numSubarraysWithSum([1,0,1,0,1], 0)) // 2
        print(numSubarraysWithSum([1,0,1,0,0,1], 0)) // 4
        print(numSubarraysWithSum([1,0,1,0,0,0,1], 0)) // 7
        print(numSubarraysWithSum([1,0,1,0,1], 2)) // 4
        print(numSubarraysWithSum([0,0,0,0,0], 0)) // 15
        print(numSubarraysWithSum([0,1,0,0,1,0], 1)) // 12
    }
}

