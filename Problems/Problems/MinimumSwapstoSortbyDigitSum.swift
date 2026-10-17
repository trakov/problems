final class MinimumSwapstoSortbyDigitSum {
    func minSwaps(_ nums: [Int]) -> Int {
        let n = nums.count
        var digitSum = Array(repeating: 0, count: n)
        for (i, num) in nums.enumerated() {
            var (num, sum) = (num, 0)
            while num > 0 {
                sum += num % 10
                num /= 10
            }
            digitSum[i] = sum
        }
        var indices = Array(0..<n)
        indices.sort { a, b in
            if digitSum[a] != digitSum[b] {
                return digitSum[a] < digitSum[b]
            }
            return nums[a] < nums[b]
        }
        var targetPos = Array(repeating: 0, count: n)
        for (i, index) in indices.enumerated() {
            targetPos[index] = i
        }
        var visited = Array(repeating: false, count: n)
        var cycles = 0
        for i in 0..<n where !visited[i] {
            cycles += 1
            var j = i
            while !visited[j] {
                visited[j] = true
                j = targetPos[j]
            }
        }
        return n - cycles
    }
    
    func tests() {
        print(minSwaps([37,100])) // 1
        print(minSwaps([22,14,33,7])) // 0
        print(minSwaps([18,43,34,16])) // 2
    }
}
