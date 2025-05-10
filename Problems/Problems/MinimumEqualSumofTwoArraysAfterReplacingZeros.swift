final class MinimumEqualSumofTwoArraysAfterReplacingZeros {
    func minSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var (sum1, sum2) = (0, 0)
        var (zero1, zero2) = (0, 0)
        for num in nums1 {
            sum1 += num
            if num == 0 {
                sum1 += 1
                zero1 += 1
            }
        }
        for num in nums2 {
            sum2 += num
            if num == 0 {
                sum2 += 1
                zero2 += 1
            }
        }
        if (zero1 == 0 && sum2 > sum1) || (zero2 == 0 && sum1 > sum2) {
            return -1
        }
        return max(sum1, sum2)
    }
    
    func tests() {
        print(minSum([3,2,0,1,0], [6,5,0])) // 12
        print(minSum([2,0,2,0], [1,4])) // -1
    }
}
