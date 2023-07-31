class HouseRobberII {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }

        func helper<T>(_ nums: T) -> Int where T:Collection, T.Element == Int {
            var cur = 0
            var prev = 0
            for num in nums {
                (prev, cur) = (cur, max(cur, prev + num))
            }
            return cur
//            var dp = Array(repeating: 0, count: nums.count + 1)
//            for (i, num) in nums.enumerated() {
//                if i == 0 {
//                    dp[i+1] = max(num, dp[i])
//                } else {
//                    dp[i+1] = max(dp[i-1] + num, dp[i])
//                }
//            }
//
//            return dp.last!
        }
        
        return max(
            helper(nums.dropFirst()),
            helper(nums.dropLast())
        )
    }

    func tests() {
        print(rob([2,3,2])) // 3
        print(rob([1,2,3,1])) // 4
        print(rob([1,2,3])) // 3
    }
}
