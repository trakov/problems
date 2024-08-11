class MaximumSumof3NonOverlappingSubarrays {
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let n = nums.count
        guard n >= 3 * k else { return [] }
        if n == 3 * k { return [0, k, 2*k] }
        let sumsCount = n-k+1
        var sums = Array(repeating: 0, count: sumsCount)
        var sum = 0
        for (i, num) in nums.enumerated() {
            sum += num
            if i >= k - 1 {
                sums[i - k + 1] = sum
                sum -= nums[i - k + 1]
            }
        }
        var left = Array(repeating: 0, count: sumsCount)
        var best = 0
        for i in 0..<sumsCount {
            if sums[i] > sums[best] {
                best = i
            }
            left[i] = best
        }

        var right = Array(repeating: 0, count: sumsCount)
        best = sumsCount - 1
        for i in (0..<sumsCount).reversed() {
            if sums[i] >= sums[best] {
                best = i
            }
            right[i] = best
        }
        
        var result = [0, k, 2*k]
        for y in k..<sumsCount - k {
            let x = left[y - k]
            let z = right[y + k]
            if sums[x] + sums[y] + sums[z] >
                sums[result[0]] + sums[result[1]] + sums[result[2]] {
                result = [x, y, z]
            }
        }
        return result
    }
    
    func tests() {
        print(maxSumOfThreeSubarrays([1,2,1,2,6,7,5,1], 2))// [0,3,5]
        print(maxSumOfThreeSubarrays([1,2,1,2,1,2,1,2,1], 2))// [0,2,4]
    }
}

