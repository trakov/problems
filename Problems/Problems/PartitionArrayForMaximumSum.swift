class PartitionArrayForMaximumSum {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        var dp: [Int] = Array(repeating: -1, count: arr.count)
        return maxSum(arr, k, &dp, 0)
    }
    
    private func maxSum(_ arr: [Int], _ k: Int, _ dp: inout [Int], _ start: Int) -> Int {
        let n = arr.count
        guard start < n else { return 0 }
        guard dp[start] == -1 else { return dp[start] }
        let end = min(n, start + k)
        var currentMax = 0
        var res = 0
        for i in start ..< end {
            currentMax = max(currentMax, arr[i])
            res = max(
                res,
                currentMax * (i - start + 1) + maxSum(arr, k, &dp, i + 1)
            )
        }
        dp[start] = res
        return res
    }
    
    func tests() {
        print(maxSumAfterPartitioning([1,15,7,9,2,5,10], 3)) // 84
        print(maxSumAfterPartitioning([1,4,1,5,7,3,6,1,9,9,3], 4)) // 83
    }
}

