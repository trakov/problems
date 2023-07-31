class UncrossedLines {
    func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums2.count + 1)
        for i in 0 ..< nums1.count {
            var newDP = dp
            for j in 0 ..< nums2.count {
                if nums1[i] == nums2[j] {
                    newDP[j+1] = 1 + dp[j]
                } else {
                    newDP[j+1] = max(dp[j + 1], newDP[j])
                }
            }
            dp = newDP
        }
        return dp.last!
    }

    func maxUncrossedLines2(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = Array(
            repeating: Array(repeating: 0, count: nums2.count + 1),
            count: nums1.count + 1
        )
        for i in 0 ..< dp.count - 1 {
            for j in 0 ..< dp[i].count - 1 {
                if nums1[i] == nums2[j] {
                    dp[i+1][j+1] = 1 + dp[i][j]
                } else {
                    dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
                }
            }
        }
        return dp.last!.last!
    }
    
    func tests() {
        print(maxUncrossedLines([1,4,2], [1,2,4])) // 2
        print(maxUncrossedLines([2,5,1,2,5], [10,5,2,1,5,2])) // 3
        print(maxUncrossedLines([1,3,7,1,7,5], [1,9,2,5,1])) // 2
    }
}

