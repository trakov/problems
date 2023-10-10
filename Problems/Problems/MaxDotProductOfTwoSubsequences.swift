class MaxDotProductOfTwoSubsequences {
    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var max1 = Int.min
        var max2 = Int.min
        var min1 = Int.max
        var min2 = Int.max
        for num in nums1 {
            max1 = max(max1, num)
            min1 = min(min1, num)
        }
        for num in nums2 {
            max2 = max(max2, num)
            min2 = min(min2, num)
        }
        if max1 < 0 && min2 > 0 { return max1 * min2 }
        if min1 > 0 && max2 < 0 { return min1 * max2 }
        var m = nums2.count + 1
        var empty = Array(repeating: 0, count: m)
        var dp = empty
        var prevDp = empty
        for i in (0..<nums1.count).reversed() {
            dp = empty
            for j in (0..<nums2.count).reversed() {
                var use = nums1[i] * nums2[j] + prevDp[j + 1]
                dp[j] = max(use, prevDp[j], dp[j + 1])
            }
            prevDp = dp
        }
        return dp[0]
    }
    
    func tests() {
        print(maxDotProduct([2,1,-2,5], [3,0,-6])) // 18
        print(maxDotProduct([3,-2], [2,-6,7])) // 21
        print(maxDotProduct([-1,-1], [1,1])) // -1
    }
}

