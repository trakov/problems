class PartitionEqualSubsetSum {
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        guard sum % 2 == 0 else { return false }
        let target = sum / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        for num in nums {
            for i in stride(from: target, through: num, by: -1) {
                dp[i] = dp[i] || dp[i - num]
            }
        }
        return dp[target]
    }

    func canPartition2(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        guard sum % 2 == 0 else { return false }

        var dp = Set<Int>()
        dp.insert(0)
        var target = sum / 2
        
        for num in nums {
            for t in dp {
                if (t + num == target) { return true }
                dp.insert(t + num)
                dp.insert(t)
            }
        }
        return dp.contains(target)
    }

    func tests() {
        print(canPartition([1,5,11,5])) // true
        print(canPartition([1,2,3,5])) // false
    }
}
